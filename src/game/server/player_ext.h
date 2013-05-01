#ifndef PLAYER_EXT_H
#define PLAYER_EXT_H
#ifdef _WIN32
#pragma once
#endif

//#include "baseentity.h"
//#include "shareddefs.h"

//class cExtendProp : public CBaseEntity
class cExtendProp
{
public:
	//cExtendProp(void);
	//~cExtendProp(void);

/*
	DECLARE_SERVERCLASS();
	DECLARE_DATADESC();

					ExtendProp();
	virtual			~ExtendProp();
*/
	//int GetStartAttachment() { return m_iStartAttachment; };

	//zak переменные дл€ отображени€ статуса на экране
	bool SwitchBool(bool param);
	bool GetMyStatus(int param);

	bool bStatusTimer;
	bool bStatusTimerCenter;
	bool bStatusMyKills;
	bool bStatusTotalKills;

};
//extern cExtendProp ExtendProp;
//cExtendProp *ExtendProp;

#endif // PLAYER_EXT_H
