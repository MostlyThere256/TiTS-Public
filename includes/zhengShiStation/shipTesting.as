import classes.ShittyShips.Casstech;
import classes.ShittyShips.ShittyShipGear.EMCannon;

public function SCT():void
{
	clearOutput();
	showName("SHIPFITE\nTESTER");
	output("Start a fite?");
	clearMenu();
	addButton(0,"Yep",startAShipfite);
	addButton(1,"Othertest",startAShipfite2);
	addButton(2,"Groups",startAShipfite,true);
	if(inCombat()) addButton(4,"Norp",CombatManager.genericVictory);
	else addButton(4,"Norp",mainGameMenu);

}

public function startAShipfite2():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(new Dane());
	CombatManager.setHostileActors(new Dane());
	CombatManager.victoryScene(defeatDane);
	CombatManager.lossScene(loseToDane);
	CombatManager.displayLocation("DANE");
	CombatManager.beginCombat();
}

public function startAShipfite(dubble:Boolean = false):void
{
	/*
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Dane());
	CombatManager.victoryScene(defeatDane);
	CombatManager.lossScene(loseToDane);
	CombatManager.displayLocation("DANE");*/

/*
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(gooKnight);
	CombatManager.victoryScene(beatUpCrystalGoo);
	CombatManager.lossScene(gooKnightLossRouter);
	CombatManager.displayLocation("GOO KNIGHT");
	showGardeGoo();
	
	addButton(0,"Next",CombatManager.beginCombat);*/

	var tEnemy:ShittyShip = new Casstech();
	var pcShip:ShittyShip = shits["SHIP"];
	pcShip.createPerk("PCs");
	pcShip.inventory.push(new EMCannon());
	tEnemy.rangedWeapon = new EmptySlot();
	tEnemy.inventory = [new EMCannon()];
	CombatManager.newGroundCombat();
	if(dubble)
	{
		var tEnemy2:ShittyShip = new Casstech();
		var allyShip:ShittyShip = new Casstech();
		CombatManager.setHostileActors(tEnemy,tEnemy2);	
		CombatManager.setFriendlyActors(pcShip,allyShip);
	}
	else
	{
		CombatManager.setHostileActors(tEnemy);	
		CombatManager.setFriendlyActors(pcShip);
	}
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, tEnemy);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pcShip);
	CombatManager.victoryScene(SCT);
	CombatManager.lossScene(SCT);
	CombatManager.displayLocation("TEST");
	CombatManager.beginCombat();
}