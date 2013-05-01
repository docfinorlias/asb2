//============ Copyright (c) Valve Corporation, All rights reserved. ============
//
// 
//
//===============================================================================
#include "my_sql.h"
//#include "my_sql.h" //если убрать прекомпилед хеадс, то это можно использовать в начале. иначе совпадают имена создания Эвентов
#include "cbase.h"
#include "asw_spawn_selection.h"
#include "asw_util_shared.h"
#include "filesystem.h"
#include "vstdlib/random.h"

#include <string>
using namespace std;


// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"

int g_nSpawnDefIDs = 0;
extern bool bStatError;

//Zak работа со строками

const char *g_SpawnTypes[] =
{
	"ANY",
	"FIXED",
	"WANDERER",
	"HORDE",
	"BOSS",
	"PROP",
	"SPECIAL1",
	"SPECIAL2"
};


int SpawnTypeFromString( const char *szText )
{
	int nSpawnTypeCount = ( ( sizeof( g_SpawnTypes ) ) / sizeof( g_SpawnTypes[0] ) );
	for ( int i = 0 ; i < nSpawnTypeCount; i++ )
	{
		if ( !V_stricmp( szText, g_SpawnTypes[i] ) )
			return i;
	}

	return ASW_NPC_SPAWN_TYPE_INVALID;
}


//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
CASW_Spawn_Definition::CASW_Spawn_Definition( int nID )
{
	m_flSelectionWeight = 1.0f;
	m_nID = nID;
}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
CASW_Spawn_Definition::~CASW_Spawn_Definition()
{
	m_Entries.PurgeAndDeleteElements();
}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------

//3
void CASW_Spawn_Definition::LoadFromKeyValues( KeyValues *pKeys )
{
	m_flSelectionWeight = pKeys->GetFloat( "SelectionWeight" );
	for ( KeyValues *pKey = pKeys->GetFirstSubKey(); pKey; pKey = pKey->GetNextKey() )
	{
		if ( !Q_stricmp( pKey->GetName(), "NPC" ) )
		{
			CASW_Entry *pEntry = new CASW_Entry();
			pEntry->m_pszAlienClass = ASW_AllocString( pKey->GetString( "AlienClass" ) );
			m_Entries.AddToTail( pEntry );
		}
	}
}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
bool CASW_Spawn_Definition::ContainsAlienClass( const char *szAlienClass )
{
	for ( int i = 0; i < m_Entries.Count(); i++ )
	{
		if ( !Q_stricmp( m_Entries[i]->m_pszAlienClass, szAlienClass ) )
			return true;
	}
	return false;
}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
CASW_Spawn_Set::CASW_Spawn_Set()
{
	for ( int i = 0; i < ASW_NPC_SPAWN_TYPE_COUNT; i++ )
	{
		m_flTotalWeight[i] = 0;
	}
}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
CASW_Spawn_Set::~CASW_Spawn_Set()
{
	for ( int t = 0; t < ASW_NPC_SPAWN_TYPE_COUNT; t++ )
	{
		m_SpawnDefs[t].PurgeAndDeleteElements();
	}
}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
CASW_Spawn_Definition* CASW_Spawn_Set::GetSpawnDef( int nType )
{
	int nCount = m_SpawnDefs[nType].Count();
	float flChosen = RandomFloat( 0, m_flTotalWeight[nType] );
	for ( int i = 0; i < nCount; i++ )
	{
		flChosen -= m_SpawnDefs[nType][i]->GetSelectionWeight();
		if ( flChosen <= 0 )
		{
			return m_SpawnDefs[nType][i];
		}
	}
	return NULL;
}

CASW_Spawn_Definition* CASW_Spawn_Set::GetSpawnDefByID( int nID )
{
	for ( int t = 0; t < ASW_NPC_SPAWN_TYPE_COUNT; t++ )
	{
		for ( int i = 0; i < m_SpawnDefs[t].Count(); i++ )
		{
			if ( m_SpawnDefs[t][i]->GetID() == nID )
				return m_SpawnDefs[t][i];
		}
	}
	return NULL;
}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------

//2
void CASW_Spawn_Set::LoadFromKeyValues( KeyValues *pKeys )
{
	m_iMinDifficulty = pKeys->GetInt( "MinDifficulty" );
	m_iMaxDifficulty = pKeys->GetInt( "MaxDifficulty" );
	m_iMinHordeSize = pKeys->GetInt( "MinHordeSize" );
	m_iMaxHordeSize = pKeys->GetInt( "MaxHordeSize" );
	m_iMinWandererSize = pKeys->GetInt( "MinWandererSize" );
	m_iMaxWandererSize = pKeys->GetInt( "MaxWandererSize" );

	m_pszSetName = ASW_AllocString( pKeys->GetString( "Name", "Unnamed" ) );
	m_pszMapName = ASW_AllocString( pKeys->GetString( "Map", "*" ) );


	for ( KeyValues *pKey = pKeys->GetFirstSubKey(); pKey; pKey = pKey->GetNextKey() )
	{
		int nType = SpawnTypeFromString( pKey->GetName() );
		if ( nType != ASW_NPC_SPAWN_TYPE_INVALID )
		{
			CASW_Spawn_Definition *pSpawnDef = new CASW_Spawn_Definition( g_nSpawnDefIDs++ );
			pSpawnDef->LoadFromKeyValues( pKey );
			m_SpawnDefs[nType].AddToTail( pSpawnDef );
			m_flTotalWeight[nType] += pSpawnDef->GetSelectionWeight();
		}
	}
}

float alienDifficulty(CASW_Spawn_Definition* def) {
	const char* alien = def->GetEntry(0)->GetNPCClassname();
	
	if (Q_stricmp(alien, "asw_drone") == 0)				return 1;
	if (Q_stricmp(alien, "asw_drone_uber") == 0)		return 5;
	if (Q_stricmp(alien, "asw_drone_jumper") == 0)		return 1.5;
	if (Q_stricmp(alien, "asw_buzzer") == 0)			return 0.5;
	if (Q_stricmp(alien, "asw_ranger") == 0)			return 2;
	if (Q_stricmp(alien, "asw_parasite") == 0)			return 3;
	if (Q_stricmp(alien, "asw_parasite_defanged") == 0) return 1;
	if (Q_stricmp(alien, "asw_shieldbug") == 0)			return 8;
	if (Q_stricmp(alien, "asw_boomer") == 0)			return 3;
	if (Q_stricmp(alien, "asw_harvester") == 0)			return 6;
	if (Q_stricmp(alien, "asw_mortarbug") == 0)			return 6;
	if (Q_stricmp(alien, "asw_shaman") == 0)			return 3;
	if (Q_stricmp(alien, "asw_queen") == 0)				return 100;

	return 1;
}

float CASW_Spawn_Set::getEstimatedDifficulty(int nType) {
	int nCount = m_SpawnDefs[nType].Count();

	float difficulty = 0;

	for ( int i = 0; i < nCount; i++ )
	{
		difficulty += m_SpawnDefs[nType][i]->GetSelectionWeight() / m_flTotalWeight[nType] * alienDifficulty(m_SpawnDefs[nType][i]);

	}
	return difficulty;
}


//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
CASW_Spawn_Selection::CASW_Spawn_Selection()
{
	m_pSpawnSetKeys = NULL;
	m_pCurrentSpawnSet = NULL;
}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
CASW_Spawn_Selection::~CASW_Spawn_Selection()
{
	Reset();
}


//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
void CASW_Spawn_Selection::Init()
{
	Reset();
	LoadSpawnSets();
}


//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
void CASW_Spawn_Selection::SetCurrentSpawnSet( int iMissionDifficulty, const char* mapName )
{
	// look through our spawn sets to find any that match the difficulty
	CUtlVector<CASW_Spawn_Set*> candidatesMapMatch;
	CUtlVector<CASW_Spawn_Set*> candidatesDefaultMap;

	for ( int i = 0; i < m_SpawnSets.Count(); i++ ) {
		if ( iMissionDifficulty >= m_SpawnSets[i]->GetMinDifficulty() && iMissionDifficulty <= m_SpawnSets[i]->GetMaxDifficulty()) {
			if (Q_stricmp(mapName, m_SpawnSets[i]->GetMapName()) == 0) {
				candidatesMapMatch.AddToTail( m_SpawnSets[i] );
			} else if (Q_stricmp(m_SpawnSets[i]->GetMapName(), "*") == 0) {
				candidatesDefaultMap.AddToTail( m_SpawnSets[i] );
			}
		}
	}
	if ( candidatesMapMatch.Count() <= 0 && candidatesDefaultMap.Count() <= 0 )
	{
		Warning( "Failed to SetCurrentSpawnSet by difficulty and map as couldn't find a default SpawnSelection block which covers this difficulty range.  Requested difficulty=%d.  Supported difficulties:\n", iMissionDifficulty );
		for ( int i = 0; i < m_SpawnSets.Count(); i++ )
		{
			Msg( "%s Min=%d Max=%d Map=%s\n", m_SpawnSets[i]->GetSetName(), m_SpawnSets[i]->GetMinDifficulty(), m_SpawnSets[i]->GetMaxDifficulty(), mapName?m_SpawnSets[i]->GetMapName():"no map" );
		}
		return;
	}

	if (candidatesMapMatch.Count() > 0) {
		m_pCurrentSpawnSet = candidatesMapMatch[ RandomInt( 0, candidatesMapMatch.Count() - 1 ) ];
	} else {
		m_pCurrentSpawnSet = candidatesDefaultMap[ RandomInt( 0, candidatesDefaultMap.Count() - 1 ) ];
	}

	DevMsg("Selected spawn set: %s\n", m_pCurrentSpawnSet->GetSetName());

}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
void CASW_Spawn_Selection::LoadSpawnSets()
{
	
	//zak SpawnSet;
	
	extern const char *NOSTAT;
	extern float basever;
	extern float version;
	extern bool bNewVersion;
	extern bool bLockedMap;  //по-умолчанию карта заблокирована true
	bStatError = false;
	char buffer[1024];
	
	g_nSpawnDefIDs = 0;
	m_pSpawnSetKeys = new KeyValues( "DefaultSpawnSets" );

	Msg("*** Loading Spawn from base...");
	cSQL* myBase = new cSQL;
	if ( !myBase->cInit() ) { bStatError = true; } else {

		Q_snprintf(buffer, sizeof(buffer), "SELECT ver FROM ver");
		if(mysql_query(&myBase->conn, buffer) != 0) { bStatError = true; } else {
			myBase->res = mysql_store_result(&myBase->conn); // Получаем дескриптор результирующей таблицы (проще сливаем данные в переменную)
			if (&myBase->res != NULL) {
				if(mysql_num_rows(myBase->res) > 0) { // Если имеется хотя бы одна запись
					myBase->row = mysql_fetch_row(myBase->res);
					basever = atof(myBase->row[0]); //ver from base
				}
			}
			mysql_free_result(myBase->res); // Освобождаем память, занятую результирующей таблицей (всегда после myBase->res = mysql_store_result(&myBase->conn))
		}

		Q_snprintf(buffer, sizeof(buffer), "SELECT map_id, map_name, MinDifficulty, MaxDifficulty, MinHordeSize, MaxHordeSize, MinWandererSize, MaxWandererSize, asw_drone, asw_drone_uber, asw_drone_jumper, asw_buzzer, asw_ranger, asw_parasite, asw_parasite_defanged, asw_shieldbug, asw_boomer, asw_harvester, asw_mortarbug, asw_shaman, asw_queen FROM maps");
		//										   0	   1		 2				3			   4			 5			   6				7				 8			9				10				  11		  12		  13			14					   15			  16		  17			 18				19			20
		//Msg("*** GlobalMap: %s\n", STRING(gpGlobals->mapname));
		if(mysql_query(&myBase->conn, buffer) != 0) { bStatError = true; } else {
			myBase->res = mysql_store_result(&myBase->conn); // Получаем дескриптор результирующей таблицы (проще сливаем данные в переменную)
			if (&myBase->res != NULL) {
				if(mysql_num_rows(myBase->res) > 0) { // Если имеется хотя бы одна запись
						
					string str = "";
					MYSQL_FIELD *field;
					while((myBase->row = mysql_fetch_row(myBase->res)) != NULL) { //записываю всё в буфер
						//row[0] - это первое поле (map_id), row[1] - второе поле (map_name)

						//Msg("*** CurrentMap: %s\n", myBase->row[0]);
						if (strcmp(STRING(gpGlobals->mapname), myBase->row[0]) == 0) { //если текущая карта НЕ в списке базы, то статистику запрещаю
							bLockedMap = false; //карту разблокируем
							//Msg("\n********** Unlocked map: %s\n\n", myBase->row[1]);
						}
						
						str.append("SpawnSet { ");
							str.append("Name \""); str.append (myBase->row[1], strlen (myBase->row[1])); str.append("\" "); //map name
							str.append("Map "); str.append (myBase->row[0], strlen (myBase->row[0])); str.append(" "); //map id
							str.append("MinDifficulty "); str.append (myBase->row[2], strlen (myBase->row[2])); str.append(" "); //MinDifficulty
							str.append("MaxDifficulty "); str.append (myBase->row[3], strlen (myBase->row[3])); str.append(" "); //MaxDifficulty
							str.append("MinHordeSize "); str.append (myBase->row[4], strlen (myBase->row[4])); str.append(" "); //MinHordeSize
							str.append("MaxHordeSize "); str.append (myBase->row[5], strlen (myBase->row[5])); str.append(" "); //MaxHordeSize
							str.append("MinWandererSize "); str.append (myBase->row[6], strlen (myBase->row[6])); str.append(" "); //MinWandererSize
							str.append("MaxWandererSize "); str.append (myBase->row[7], strlen (myBase->row[7])); str.append(" "); //MaxWandererSize

							int num_fields = mysql_num_fields(myBase->res);
							for (int i = 8; i < num_fields; i++) {
								field = mysql_fetch_field_direct(myBase->res, i); // Получение названия текущего поля
								if (atoi (myBase->row[i]) != 0) {
									str.append("WANDERER { ");
										str.append("SelectionWeight "); str.append (myBase->row[i], strlen (myBase->row[i])); str.append(" "); //asw_drone
										str.append("NPC { ");
											str.append("AlienClass "); str.append (field->name, strlen (field->name)); str.append(" "); //asw_drone
										str.append("} ");	
									str.append("} ");
								}
							}
						str.append("} ");
					}
					
					int size = str.length(); char* text = new char[size+2]; str.copy(text, size); text[size] = 0; //null terminated string
					m_pSpawnSetKeys->LoadFromBuffer("DefaultSpawnSets", text);
					Msg("OK!\n");
				}
			}
			mysql_free_result(myBase->res); // Освобождаем память, занятую результирующей таблицей (всегда после myBase->res = mysql_store_result(&myBase->conn))
		}
		
	}
	myBase->cDestroy();
	delete myBase;
	if (bStatError)
		Msg("Bad!\n");

	if (basever != (version-21)) {
		bStatError = true;
		bNewVersion = true;
		Msg("\n\nNEW VERSION DETECTED! PLEASE UPDATE THIS SERVER\n\n");
	} else { bNewVersion = false; }
	
	if (bStatError) {
		Msg("\nSpawnset read error. Using default settings\n");
		Msg("%s\n\n", NOSTAT);
		const char *buf = "SpawnSet	{ \
			Name				\"default set\" \
			Map					* \
			MinDifficulty		1 \
			MaxDifficulty		99 \
			MinHordeSize		10 \
			MaxHordeSize		30 \
			MinWandererSize		2 \
			MaxWandererSize		6 \
			WANDERER { \
				SelectionWeight	50 \
				NPC { \
					AlienClass	asw_drone \
				} \
			} \
			WANDERER { \
				SelectionWeight	5 \
				NPC { \
					AlienClass	asw_drone_uber \
				} \
			} \
			WANDERER { \
				SelectionWeight	10 \
				NPC { \
					AlienClass	asw_drone_jumper \
				} \
			} \
			WANDERER { \
				SelectionWeight	20 \
				NPC { \
					AlienClass	asw_buzzer \
				} \
			} \
			WANDERER { \
				SelectionWeight	15 \
				NPC { \
					AlienClass	asw_ranger \
				} \
			} \
			WANDERER { \
				SelectionWeight	1 \
				NPC { \
					AlienClass	asw_parasite \
				} \
			} \
			WANDERER { \
				SelectionWeight	10 \
				NPC { \
					AlienClass	asw_parasite_defanged \
				} \
			} \
			WANDERER { \
				SelectionWeight	1 \
				NPC { \
					AlienClass	asw_shieldbug \
				} \
			} \
			WANDERER { \
				SelectionWeight	8 \
				NPC { \
					AlienClass	asw_boomer \
				} \
			} \
			WANDERER { \
				SelectionWeight	3 \
				NPC { \
					AlienClass	asw_harvester \
				} \
			} \
			WANDERER { \
				SelectionWeight	3 \
				NPC { \
					AlienClass	asw_mortarbug \
				} \
			} \
		}";
		
		//Zak
		int size = sizeof(buf)+1; char *buff = (char*)buf; buff[size] = 0; //null terminated string
		m_pSpawnSetKeys->LoadFromBuffer("DefaultSpawnSets", buff);
		
	}

	if (bLockedMap) {
		bStatError = true;
		Msg("*** Unknown map!\n");
	}

	//1
	for ( KeyValues *pKey = m_pSpawnSetKeys; pKey; pKey = pKey->GetNextKey() )
	{
		if ( !Q_stricmp( pKey->GetName(), "SpawnSet" ) )
		{
			CASW_Spawn_Set *pSet = new CASW_Spawn_Set();
			pSet->LoadFromKeyValues( pKey );
			if ( !m_pCurrentSpawnSet )
			{
				m_pCurrentSpawnSet = pSet;
			}
			m_SpawnSets.AddToTail( pSet );
		}
	}
	


}

//-----------------------------------------------------------------------------
// Purpose:
//-----------------------------------------------------------------------------
void CASW_Spawn_Selection::Reset()
{
	m_SpawnSets.PurgeAndDeleteElements();
	if ( m_pSpawnSetKeys )
	{
		m_pSpawnSetKeys->deleteThis();
		m_pSpawnSetKeys = NULL;
	}	
	m_pCurrentSpawnSet = NULL;
}


//-----------------------------------------------------------------------------
// Purpose: 
// Input  : *szName - 
// Output : Returns true on success
//-----------------------------------------------------------------------------
bool CASW_Spawn_Selection::IsAvailableNPC( const char *szName )
{
	return true;
}
