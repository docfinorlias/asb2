//============ Copyright (c) Valve Corporation, All rights reserved. ============
//
// 
//
//===============================================================================
#ifndef ASW_SPAWN_SELECTION_H
#define ASW_SPAWN_SELECTION_H
#ifdef _WIN32
#pragma once
#endif

#include "missionchooser/iasw_spawn_selection.h"
#include "utlvector.h"
#include "KeyValues.h"


class CASW_Entry	
{
public:

	// Implementation of the IASWSpawnDefinitionEntry Interface.
	virtual const char *GetNPCClassname() { return m_pszAlienClass; }

public:

	CASW_Entry()
	{
		m_pszAlienClass = NULL;
	}

	char* m_pszAlienClass;
};


//=============================================================================
//
// Data describing a particular alien spawn (can be one or more aliens of various classes)
//
class CASW_Spawn_Definition
{
public:

	// Implementation of the IASWSpawnDefinition Interface.
	virtual int GetEntryCount()	{ return m_Entries.Count(); }
	virtual CASW_Entry *GetEntry( int nEntry ) { Assert( nEntry >= 0 && nEntry < m_Entries.Count() ); return m_Entries[nEntry]; }
	virtual int GetID() { return m_nID; }

public:

	CASW_Spawn_Definition( int nID );
	~CASW_Spawn_Definition();

	void LoadFromKeyValues( KeyValues *pKeys );

	float GetSelectionWeight() { return m_flSelectionWeight; }
	bool ContainsAlienClass( const char *szAlienClass );

	void ListSpawnDef();
	
private:

	float m_flSelectionWeight;
	CUtlVector<CASW_Entry*> m_Entries;
	int m_nID;
};


//=============================================================================
//
// Holds spawn definitions for all types of spawning within an area (typically a whole mission)
//
class CASW_Spawn_Set
{
public:

	CASW_Spawn_Set();
	~CASW_Spawn_Set();

	// this function returns a random wanderer/horde/boss
	CASW_Spawn_Definition* GetSpawnDef( int nType );
	CASW_Spawn_Definition* GetSpawnDefByID( int nID );

	// chance of spawning a feeder group per 256x256 grid square
	const char *GetSetName() { return m_pszSetName; }
	const char *GetMapName() { return m_pszMapName; }

	void LoadFromKeyValues( KeyValues *pKeys );

	int GetMinDifficulty() { return m_iMinDifficulty; }
	int GetMaxDifficulty() { return m_iMaxDifficulty; }

	// number of encounters per mission
	int GetMinHordeSize() { return m_iMinHordeSize; }
	int GetMaxHordeSize() { return m_iMaxHordeSize; }

	// number of spawndefs in each encounter
	int GetMinWandererSize() { return m_iMinWandererSize; }
	int GetMaxWandererSize() { return m_iMaxWandererSize; }

	float getEstimatedDifficulty(int nType);
private:

	CUtlVector<CASW_Spawn_Definition*> m_SpawnDefs[ASW_NPC_SPAWN_TYPE_COUNT];
	float m_flTotalWeight[ASW_NPC_SPAWN_TYPE_COUNT];

	int m_iMinDifficulty;
	int m_iMaxDifficulty;
	int m_iMinHordeSize;
	int m_iMaxHordeSize;
	int m_iMinWandererSize;
	int m_iMaxWandererSize;

	const char *m_pszSetName;
	const char* m_pszMapName;
};

CASW_Spawn_Set *CurrentSpawnSet();

//=============================================================================
//
// Manages loading and setting of spawn sets
//
class CASW_Spawn_Selection
{
public:

	// Implementation of the IASWSpawnSelection Interface.
	CASW_Spawn_Definition *GetSpawnDefinition( int nSpawnType )	{ Assert( GetCurrentSpawnSet() ); return GetCurrentSpawnSet()->GetSpawnDef( nSpawnType ); }
	CASW_Spawn_Definition* GetSpawnDefByID( int nID );

	bool IsAvailableNPC( const char *szName );
	virtual void SetCurrentSpawnSet( int iMissionDifficulty, const char* mapName );		// sets spawn set based on the difficulty passed in
	//virtual bool SetCurrentSpawnSet( const char *szSetName );		// sets spawn set by name
	//virtual void DumpCurrentSpawnSet();

public:

	// Construction/Destruction.
	CASW_Spawn_Selection();
	~CASW_Spawn_Selection();
	void Init();

	void SetCurrentSpawnSet( CASW_Spawn_Set* pSet ) { m_pCurrentSpawnSet = pSet; }
	CASW_Spawn_Set *GetCurrentSpawnSet() { return m_pCurrentSpawnSet; }
	//CASW_Spawn_Set *GetSpawnSet( const char *szSetName );

private:

	void LoadSpawnSets();
	void Reset();

private:

	CUtlVector<CASW_Spawn_Set*> m_SpawnSets;
	CASW_Spawn_Set *m_pCurrentSpawnSet;
	KeyValues *m_pSpawnSetKeys;
};

int SpawnTypeFromString( const char *szText );

#endif // ASW_SPAWN_SELECTION_H
