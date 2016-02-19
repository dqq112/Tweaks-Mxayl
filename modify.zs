/*
		MineTweaker Script
		Create By.Indexyz
		2016-2-20
		Version.Debug.1
 */
# Import Space
	import minetweaker.item.IItemStack;
	import mods.nei.NEI;
	import mods.thaumcraft.Crucible;
	import mods.thaumcraft.Arcane;
	import mods.thaumcraft.Infusion;
	import mods.railcraft.RockCrusher;
	import mods.railcraft.Rolling;
	import mods.projecte.PhiloStone;
	import mods.projecte.KleinStar;

# Val Space
	val IronPlate   = <Railcraft:part.plate>;
	val SteelPlate  = <Railcraft:part.plate:1>;
	val TinPlate    = <Railcraft:part.plate:2>;
	val CopperPlate = <Railcraft:part.plate:3>;
	val IronWrench  = <OpenBlocks:wrench>;
# Add item that you want to remove here!
	var baneditems = 
	[
	# Because not IC2 support now!
		<IC2:itemPartCircuit>,
		<IC2:itemToolCutter>,
		<IC2:itemToolForgeHammer>,
		<IC2:blockMachine>,
		<IC2:blockCrop>,	
		<Magneticraft:InfiniteWater>,
		<appliedenergistics2:tile.BlockQuartzGrowthAccelerator>,
		<ae2stuff:Grower>,
		<advgenerators:TurbineBladeBronze>,
		<advgenerators:TurbineRotorBronze>,
		<advgenerators:TurbineKitBronze>,
		<Botania:pool:2>
	] as IItemStack[];
	for i, item in baneditems 
	{
		var baneditem = baneditems[i];
		recipes.remove(baneditem);
		NEI.hide(baneditem);	
	}
# Ore Dictionary
	<ore:slimeball>.addAll(<ore:itemRubber>);
	<ore:plateIron>.add(IronPlate);
# Minecraft Modify
	# Val Space
		val Redstone    = <ore:dustRedstone>;
		val BlockIron   = <minecraft:iron_block>;
		val Sand        = <ore:sand>;
		val Glass       = <ore:blockGlass>;
	# Furnace Recipes
		furnace.remove(Glass);
		PhiloStone.removePhiloSmelting(<minecraft:glass>);
		mods.railcraft.BlastFurnace.addRecipe(<minecraft:sand>,true,false,5,<minecraft:glass>);
		Crucible.addRecipe("ASPECTS",<minecraft:glass>,<minecraft:sand>,"terra 1");
# StorageSilo Modify
	recipes.remove(<storageSilo:storagesilo>);
	recipes.addShaped(<storageSilo:storagesilo>,[[<ore:chest>,<ore:chest>,<ore:chest>],
												 [<ore:chest>,IronWrench,<ore:chest>],
												 [<ore:chest>,<ore:chest>,<ore:chest>]]);
	mods.thaumcraft.Arcane.addShaped("ASPECTS", <storageSilo:storagesilo>, "ordo 8, aer 2", [[<ore:chest>,<ore:chest>,<ore:chest>],
																						 	 [<ore:chest>,null,<ore:chest>],
																							 [<ore:chest>,<ore:chest>,<ore:chest>]]);
# RailCraft Modify
	recipes.remove(<Railcraft:machine.alpha:12>);
	recipes.addShaped(<Railcraft:machine.alpha:12> * 8,[[<ore:soulSand>,IronWrench,<ore:soulSand>],
														[IronWrench,<minecraft:magma_cream>,IronWrench],
														[<ore:soulSand>,IronWrench,<ore:soulSand>]]);

	recipes.remove(<Railcraft:machine.beta>);
	mods.railcraft.Rolling.addShaped(<Railcraft:machine.beta>, [[IronPlate, IronPlate, null], 
	                                                            [IronPlate, IronPlate, null],
	                                                            [null, null, null]]);
	recipes.remove(<Railcraft:machine.beta:13>);
	mods.railcraft.Rolling.addShaped(<Railcraft:machine.beta:13>, [[SteelPlate, SteelPlate, null], 
	                                                               [SteelPlate, SteelPlate, null],
	                                                               [null, null, null]]);
# MagnetiCraft Modify
	# Val Space
		val CopperCable    = <Magneticraft:item.cable_low>;
		val CopperCoil     = <Magneticraft:item.heavy_copper_coil>;
		val CopperHeatCoil = <Magneticraft:item.heatcoil_copper>;
		val IronHeatCoil   = <Magneticraft:item.heatcoil_iron>;
		val WHeatCoil 	   = <Magneticraft:item.heatcoil_tungsten>;
		val Diode 		   = <Magneticraft:diode>;
		val MachineBlock   = <Magneticraft:machine_housing>;
	# Normal Machine Recipes
		recipes.remove(<Magneticraft:firebox>);
		recipes.addShaped(<Magneticraft:firebox>,[[<Railcraft:part.plate:3>,<Magneticraft:item.heat_cable>,<Railcraft:part.plate:3>],
												  [<Magneticraft:item.heat_cable>,<Magneticraft:item.heatcoil_copper>,<Magneticraft:item.heat_cable>],
												  [<Railcraft:part.plate:3>,<Magneticraft:item.heat_cable>,<Railcraft:part.plate:3>]]);

		recipes.remove(<Magneticraft:heater>);
		recipes.addShaped(<Magneticraft:heater>, [[<ore:ingotCarbide>,CopperPlate,<ore:ingotCarbide>],
												  [CopperPlate,<Magneticraft:item.heatcoil_copper>,CopperPlate],
												  [<ore:ingotCarbide>,CopperPlate,<ore:ingotCarbide>]]);

		recipes.remove(MachineBlock);
		recipes.addShaped(MachineBlock,[[SteelPlate,<ore:ingotCarbide>,SteelPlate],
										[<ore:ingotCarbide>,IronWrench,<ore:ingotCarbide>],
										[SteelPlate,<ore:ingotCarbide>,SteelPlate]]);
    # Items Recipes
    	recipes.remove(CopperCable);
    	recipes.addShaped(CopperCable,[[<ore:itemRubber>,CopperPlate,<ore:itemRubber>],
    								  [],
    								  []]);
    	recipes.remove(CopperCoil);
    	recipes.addShaped(CopperCoil,[[CopperPlate,CopperPlate,CopperPlate],
    								  [CopperPlate,CopperCable,CopperPlate],
    								  [CopperPlate,CopperPlate,CopperPlate]]);
# AE2 Modify
	# Val Space
		val CertusQCrystal 	   = <ore:crystalCertusQuartz>;
		val FluixCrystal 	   = <ore:crystalFluix>;
		val EndQCrystal 	   = <ore:gemQuartz>;
		val Silicon            = <ore:itemSilicon>;

		val PureCertusQCrystal = <appliedenergistics2:item.ItemMultiMaterial:10>;
		val PureFluixCrystal   = <appliedenergistics2:item.ItemMultiMaterial:12>;
		val PureEndQCrystal    = <appliedenergistics2:item.ItemMultiMaterial:11>;
		val CertusQuartzSeed   = <appliedenergistics2:item.ItemCrystalSeed>;
		val NetherQuartzSeed   = <appliedenergistics2:item.ItemCrystalSeed:600>;
 		val FluixSeed 		   = <appliedenergistics2:item.ItemCrystalSeed:1200>;
 		val FluixGlassCable    = <appliedenergistics2:item.ItemMultiPart:16>;

 		val Inscriber 		   = <appliedenergistics2:tile.BlockInscriber>;
 		val CraftingUnit       = <appliedenergistics2:tile.BlockCraftingUnit>;
 		val FormationCore      = <appliedenergistics2:item.ItemMultiMaterial:43>;
		val AnnihilationCore   = <appliedenergistics2:item.ItemMultiMaterial:44>;
		val AEInterface 	   = <appliedenergistics2:tile.BlockInterface>;
		val GoldCircuit 	   = <appliedenergistics2:item.ItemMultiMaterial:22>;
		val CertusCircuit 	   = <appliedenergistics2:item.ItemMultiMaterial:23>;
		val DiamondCircuit 	   = <appliedenergistics2:item.ItemMultiMaterial:24>;
		val SiliconPCB         = <appliedenergistics2:item.ItemMultiMaterial:20>;

		val Storage1K          = <appliedenergistics2:item.ItemBasicStorageCell.1k>;
		val Storage4K          = <appliedenergistics2:item.ItemBasicStorageCell.4k>;
		val Storage16K         = <appliedenergistics2:item.ItemBasicStorageCell.16k>;
		val Storage64K         = <appliedenergistics2:item.ItemBasicStorageCell.64k>;
 	# Pure Crystal
		# RaliCraft Blast Furnace
		mods.railcraft.BlastFurnace.addRecipe(CertusQuartzSeed, true, false, 130, PureCertusQCrystal);
		mods.railcraft.BlastFurnace.addRecipe(FluixSeed		  , true, false, 130, PureFluixCrystal);
		mods.railcraft.BlastFurnace.addRecipe(NetherQuartzSeed, true, false, 130, PureEndQCrystal);
		# TC Recipes
		Crucible.addRecipe("ASPECTS", PureCertusQCrystal, CertusQCrystal, "vitreus 2");
		Crucible.addRecipe("ASPECTS", PureFluixCrystal  , FluixCrystal  , "vitreus 2");
		Crucible.addRecipe("ASPECTS", PureEndQCrystal   , EndQCrystal   , "vitreus 2");
	# Get Machine
		recipes.remove(Inscriber);
		# Tech Recipes
		recipes.addShaped(Inscriber,[[<Railcraft:part.plate:1>,<minecraft:sticky_piston>,<Railcraft:part.plate:1>],
									 [null,null,FluixGlassCable],
									 [<Railcraft:part.plate:1>,<minecraft:sticky_piston>,<Railcraft:part.plate:1>]]);
		# Magic Recipes
		Arcane.addShaped("ASPECTS", Inscriber, "ordo 8, terra 8", [[<ore:quicksilver>, <minecraft:sticky_piston>, <ore:quicksilver>], 
                                                          		   [null, null, FluixGlassCable],
                                                          		   [<ore:quicksilver>, <minecraft:sticky_piston>, <ore:quicksilver>]]);
	# Auto Crafting Recipes
		recipes.remove(FormationCore);
		recipes.addShaped(FormationCore * 2,[[PureFluixCrystal,PureCertusQCrystal,PureFluixCrystal],
										     [PureCertusQCrystal,Diode,PureCertusQCrystal],
										     [PureFluixCrystal,PureCertusQCrystal,PureFluixCrystal]]);
		recipes.remove(AnnihilationCore);
		recipes.addShaped(AnnihilationCore * 2,[[PureFluixCrystal,PureEndQCrystal,PureFluixCrystal],
												[PureEndQCrystal,Diode,PureEndQCrystal],
												[PureFluixCrystal,PureEndQCrystal,PureFluixCrystal]]);
		recipes.remove(CraftingUnit);
		recipes.addShaped(CraftingUnit, [[GoldCircuit,FluixGlassCable,CertusCircuit],
										 [CopperCoil,AEInterface,CopperCoil],
										 [CertusCircuit,FluixGlassCable,GoldCircuit]]);
# Adv Generators Modify
	# Val Space
		val IronFrame          = <advgenerators:IronFrame>;
		val IronBlade          = <advgenerators:TurbineBladeIron>;
		val SteelBlade         = <advgenerators:TurbineBladeSteel>;
		val IronTubing         = <advgenerators:IronTubing>;
		val RedstoneIronWiring = <advgenerators:IronWiring>;
		val Controller         = <advgenerators:Controller>;
		val PressureValve      = <advgenerators:PressureValve>;
	# Item Recipes
		recipes.remove(IronFrame);
		recipes.addShaped(IronFrame,[[null,IronPlate,null],
									 [IronPlate,null,IronPlate],
									 [null,IronPlate,null]]);
		recipes.remove(SteelBlade);
		recipes.addShaped(SteelBlade,[[null,SteelPlate,SteelPlate],
									  [null,SteelPlate,SteelPlate],
									  [null,null,SteelPlate]]);
		recipes.remove(IronTubing);
		recipes.addShaped(IronTubing * 8,[[IronPlate,<ore:blockGlass>,IronPlate],
									  	  [IronPlate,<ore:blockGlass>,IronPlate],
									  	  [IronPlate,<ore:blockGlass>,IronPlate]]);
        recipes.remove(Controller);
        recipes.addShaped(Controller,[[CopperCable,CopperCable,CopperCable],
        							  [Diode,CertusCircuit,Diode],
        							  [CopperCable,CopperCable,CopperCable]]);
        recipes.remove(RedstoneIronWiring);
        recipes.addShaped(RedstoneIronWiring * 8,[[IronPlate,Redstone,IronPlate],
        									  	  [Redstone,IronWrench,Redstone],
        									  	  [IronPlate,Redstone,IronPlate]]);
        recipes.remove(PressureValve);
        recipes.addShaped(PressureValve,[[null,IronPlate,null],
        								  [IronTubing,IronTubing,IronTubing],
        								  [null,IronPlate,null]]);
        recipes.remove(IronBlade);
        recipes.addShaped(IronBlade,[[null,IronPlate,IronPlate],
        							 [null,IronPlate,IronPlate],
        							 [null,null,IronPlate]]);
# Oepn Computer Modify
	# Val Space
		val UnWorkPCB  = <OpenComputers:item:30>;
		val Disk       = <OpenComputers:item:19>;
		val Transistor = <OpenComputers:item:23>;
	# Item Recipes
		recipes.remove(UnWorkPCB);
		recipes.addShaped(UnWorkPCB,[[null,SiliconPCB,null],
									 [SiliconPCB,SteelPlate,SiliconPCB],
									 [null,SiliconPCB,null]]);
		recipes.remove(Disk);
		recipes.addShaped(Disk,[[null,null,null],
								[SiliconPCB,Storage1K,SiliconPCB],
								[null,null,null]]);
		recipes.remove(Transistor);
		recipes.addShapeless(Transistor,[IronPlate,GoldCircuit]);
# Bot Modify
	# Val Recipes
		val Altar     			   = <Botania:altar>;
		val MagicPool        	   = <Botania:pool>;
		val LiveRock               = <Botania:livingrock>;

		val GaiaIngot              = <ore:gaiaIngot>;
		val ElvenIngot             = <ore:ingotElvenElementium>;
		val ManaIngot              = <ore:ore:ingotManasteel>;
		val TerraIngot             = <ore:ingotTerrasteel>;

		val WhiteMysticalPetal     = <Botania:petal>;
		val OrangeMysticalPetal    = <Botania:petal:1>;
		val MagentaMysticalPetal   = <Botania:petal:2>;
		val LightBlueMysticalPetal = <Botania:petal:3>;
		val YellowMysticalPetal    = <Botania:petal:4>;
		val LimeMysticalPetal      = <Botania:petal:5>;
		val PinkMysticalPetal      = <Botania:petal:6>;
		val GrayMysticalPetal      = <Botania:petal:7>;
		val LightGrayMysticalPetal = <Botania:petal:8>;
		val CyanMysticalPetal      = <Botania:petal:9>;
		val PurpleMysticalPetal    = <Botania:petal:10>;
		val BlueMysticalPetal      = <Botania:petal:11>;
		val BrownMysticalPetal     = <Botania:petal:12>;
		val GreenMysticalPetal     = <Botania:petal:13>;
		val RedMysticalPetal       = <Botania:petal:14>;
		val BlackMysticalPetal     = <Botania:petal:15>;
		
		# Items
			var MysticalPetal = 
			[
				WhiteMysticalPetal,
				OrangeMysticalPetal,
				MagentaMysticalPetal,
				LightBlueMysticalPetal,
				YellowMysticalPetal,
				LimeMysticalPetal,
				PinkMysticalPetal,
				GrayMysticalPetal,
				LightGrayMysticalPetal,
				CyanMysticalPetal,
				PurpleMysticalPetal,
				BlueMysticalPetal,
				BrownMysticalPetal,
				GreenMysticalPetal,
				RedMysticalPetal,
				BlackMysticalPetal
			] as IItemStack[];

			var PoolCraftList = 
			[
				BlockIron,
				BlockIron,
				BlockIron,
				BlockIron,
				<ForgeMicroblock:sawIron>
			] as IItemStack[];
	# Item Recipes
		recipes.remove(Altar);
		Infusion.addRecipe("ASPECTS", <Thaumcraft:blockMetalDevice>, MysticalPetal, "victus 64, lux 64"     , Altar    , 5);
		recipes.remove(MagicPool);
		Infusion.addRecipe("ASPECTS", LiveRock                     , PoolCraftList, "victus 64, potentia 64", MagicPool, 5);
# BuildCraft Modify
	# Val Space
		val TankBlock = <BuildCraft|Factory:tankBlock>;
# EnderStorge Modify
	# Val Space
		# Wools
			var WoolWhite           = <minecraft:wool:0>;
			var WoolOrange          = <minecraft:wool:1>;
			var WoolMagenta         = <minecraft:wool:2>;
			var WoolLightBlue       = <minecraft:wool:3>;
			var WoolYellow          = <minecraft:wool:4>;
			var WoolLime            = <minecraft:wool:5>;
			var WoolPink            = <minecraft:wool:6>;
			var WoolGray            = <minecraft:wool:7>;
			var WoolLightGray       = <minecraft:wool:8>;
			var WoolCyan            = <minecraft:wool:9>;
			var WoolPurple          = <minecraft:wool:10>;
			var WoolBlue            = <minecraft:wool:11>;
			var WoolBrown           = <minecraft:wool:12>;
			var WoolGreen           = <minecraft:wool:13>;
			var WoolRed             = <minecraft:wool:14>;
			var WoolBlack           = <minecraft:wool:15>;
		# Ender Chests
			var EnderChestWhite     = <EnderStorage:enderChest:0>;
			var EnderChestOrange    = <EnderStorage:enderChest:273>;
			var EnderChestMagenta   = <EnderStorage:enderChest:546>;
			var EnderChestLightBlue = <EnderStorage:enderChest:819>;
			var EnderChestYellow    = <EnderStorage:enderChest:1092>;
			var EnderChestLime      = <EnderStorage:enderChest:1365>;
			var EnderChestPink      = <EnderStorage:enderChest:1638>;
			var EnderChestGray      = <EnderStorage:enderChest:1911>;
			var EnderChestLightGray = <EnderStorage:enderChest:2184>;
			var EnderChestCyan      = <EnderStorage:enderChest:2457>;
			var EnderChestPurple    = <EnderStorage:enderChest:2730>;
			var EnderChestBlue      = <EnderStorage:enderChest:3003>;
			var EnderChestBrown     = <EnderStorage:enderChest:3276>;
			var EnderChestGreen     = <EnderStorage:enderChest:3549>;
			var EnderChestRed       = <EnderStorage:enderChest:3822>;
			var EnderChestBlack     = <EnderStorage:enderChest:4095>;
		# Ender Pouches
			var EnderPouchWhite     = <EnderStorage:enderPouch:0>;
			var EnderPouchOrange    = <EnderStorage:enderPouch:273>;
			var EnderPouchMagenta   = <EnderStorage:enderPouch:546>;
			var EnderPouchLightBlue = <EnderStorage:enderPouch:819>;
			var EnderPouchYellow    = <EnderStorage:enderPouch:1092>;
			var EnderPouchLime      = <EnderStorage:enderPouch:1365>;
			var EnderPouchPink      = <EnderStorage:enderPouch:1638>;
			var EnderPouchGray      = <EnderStorage:enderPouch:1911>;
			var EnderPouchLightGray = <EnderStorage:enderPouch:2184>;
			var EnderPouchCyan      = <EnderStorage:enderPouch:2457>;
			var EnderPouchPurple    = <EnderStorage:enderPouch:2730>;
			var EnderPouchBlue      = <EnderStorage:enderPouch:3003>;
			var EnderPouchBrown     = <EnderStorage:enderPouch:3276>;
			var EnderPouchGreen     = <EnderStorage:enderPouch:3549>;
			var EnderPouchRed       = <EnderStorage:enderPouch:3822>;
			var EnderPouchBlack     = <EnderStorage:enderPouch:4095>;
		# Ender Tanks
			var EnderTankWhite      = <EnderStorage:enderChest:4096>; 
			var EnderTankOrange     = <EnderStorage:enderChest:4369>; 
			var EnderTankMagenta    = <EnderStorage:enderChest:4642>;
			var EnderTankLightBlue  = <EnderStorage:enderChest:4915>;
			var EnderTankYellow     = <EnderStorage:enderChest:5188>;
			var EnderTankLime       = <EnderStorage:enderChest:5461>;
			var EnderTankPink       = <EnderStorage:enderChest:5734>;
			var EnderTankGray       = <EnderStorage:enderChest:6007>;
			var EnderTankLightGray  = <EnderStorage:enderChest:6280>;
			var EnderTankCyan       = <EnderStorage:enderChest:6553>;
			var EnderTankPurple     = <EnderStorage:enderChest:6826>;
			var EnderTankBlue       = <EnderStorage:enderChest:7099>;
			var EnderTankBrown      = <EnderStorage:enderChest:7372>;
			var EnderTankGreen      = <EnderStorage:enderChest:7645>;
			var EnderTankRed        = <EnderStorage:enderChest:7918>;
			var EnderTankBlack      = <EnderStorage:enderChest:8191>;
		# Item List
			var Wools = 
			[
			    WoolWhite,
			    WoolOrange,
			    WoolMagenta,
			    WoolLightBlue,
			    WoolYellow,
			    WoolLime,
			    WoolPink,
			    WoolGray,
			    WoolLightGray,
			    WoolCyan,
			    WoolPurple,
			    WoolBlue,
			    WoolBrown,
			    WoolGreen,
			    WoolRed,
			    WoolBlack
			] as IItemStack[];

			var EnderChests = 
			[
			    EnderChestWhite,
			    EnderChestOrange,
			    EnderChestMagenta,
			    EnderChestLightBlue,
			    EnderChestYellow,
			    EnderChestLime,
			    EnderChestPink,
			    EnderChestGray,
			    EnderChestLightGray,
			    EnderChestCyan,
			    EnderChestPurple,
			    EnderChestBlue,
			    EnderChestBrown,
			    EnderChestGreen,
			    EnderChestRed,
			    EnderChestBlack
			] as IItemStack[];

			var EnderTanks = 
			[
			    EnderTankWhite,
			    EnderTankOrange,
			    EnderTankMagenta,
			    EnderTankLightBlue,
			    EnderTankYellow,
			    EnderTankLime,
			    EnderTankPink,
			    EnderTankGray,
			    EnderTankLightGray,
			    EnderTankCyan,
			    EnderTankPurple,
			    EnderTankBlue,
			    EnderTankBrown,
			    EnderTankGreen,
			    EnderTankRed,
			    EnderTankBlack
			] as IItemStack[];

			var EnderPouchs = 
			[
				EnderPouchWhite,
			    EnderPouchOrange,
			    EnderPouchMagenta,
			    EnderPouchLightBlue,
			    EnderPouchYellow,
			    EnderPouchLime,
			    EnderPouchPink,
			    EnderPouchGray,
			    EnderPouchLightGray,
			    EnderPouchCyan,
			    EnderPouchPurple,
			    EnderPouchBlue,
			    EnderPouchBrown,
			    EnderPouchGreen,
			    EnderPouchRed,
			    EnderPouchBlack
			] as IItemStack[];
	# Item Recipes
		for i, Wool in Wools 
		{
			var EnderChest = EnderChests[i];
			var EnderTank  = EnderTanks[i];
			var EnderPouch = EnderPouchs[i];

			recipes.remove(EnderChest);
			recipes.remove(EnderTank);
			recipes.remove(EnderPouch);
			# Technology Recipes
				recipes.addShaped(EnderChest,[[IngotBedRock,Wool,IngotBedRock],
											  [<ore:rodBlaze>,<storageSilo:storagesilo>,<ore:rodBlaze>],
											  [IngotBedRock,<ore:pearlEnderEye>,IngotBedRock]]);
				recipes.addShaped(EnderTank,[[IngotBedRock,Wool,IngotBedRock],
											 [<ore:rodBlaze>,TankBlock,<ore:rodBlaze>],
											 [IngotBedRock,<ore:pearlEnderEye>,IngotBedRock]]);
				
				recipes.addShaped(EnderPouch,[[HSLAIngot,Wool,HSLAIngot],
											  [<ore:rodBlaze>,<storageSilo:storagesilo>,<ore:rodBlaze>],
											  [HSLAIngot,<ore:pearlEnderEye>,HSLAIngot]]);
			# Magic Recipes
				recipes.addShaped(EnderChest,[[GaiaIngot,Wool,GaiaIngot],
											  [<ore:rodBlaze>,<storageSilo:storagesilo>,<ore:rodBlaze>],
											  [GaiaIngot,<ore:pearlEnderEye>,GaiaIngot]]);
				recipes.addShaped(EnderTank,[[GaiaIngot,Wool,GaiaIngot],
											 [<ore:rodBlaze>,TankBlock,<ore:rodBlaze>],
											 [GaiaIngot,<ore:pearlEnderEye>,GaiaIngot]]);
				
				recipes.addShaped(EnderPouch,[[ElvenIngot,Wool,ElvenIngot],
											  [<ore:rodBlaze>,<storageSilo:storagesilo>,<ore:rodBlaze>],
											  [ElvenIngot,<ore:pearlEnderEye>,ElvenIngot]]);
		}
# Blod Magic Modify
	# Val Space
		val BM_Altar         = <AWWayofTime:Altar>;
		val SacrificialKnife = <AWWayofTime:sacrificialKnife>;
		val OutRouting       = <AWWayofTime:outputRoutingFocus>;
		val InputRouting     = <AWWayofTime:inputRoutingFocus>;
		val MagicDust        = <AWWayofTime:magicales>;
		val LifeHolder       = <AWWayofTime:bloodMagicBaseItems:31>;
	# Item Modify
		recipes.remove(BM_Altar);
		recipes.addShaped(BM_Altar,[[null,<ore:gemDiamond>,null],
								    [GaiaIngot,LiveRock,GaiaIngot]]);
		recipes.remove(SacrificialKnife);
		recipes.addShaped(SacrificialKnife,[[<ore:blockGlass>,<ore:blockGlass>,<ore:blockGlass>],
											[null,TerraIngot,<ore:blockGlass>],
											[TerraIngot,null,<ore:blockGlass>]]);
# Project E Modify
	# Val Space
		val PhiloStone           = <ProjectE:item.pe_philosophers_stone>;
		val IronRing             = <ProjectE:item.pe_ring_iron_band>;

		val LowConvalenceDust    = <ProjectE:item.pe_covalence_dust>;
		val NormalConvalenceDust = <ProjectE:item.pe_covalence_dust:1>;
		val HighConvalenceDust   = <ProjectE:item.pe_covalence_dust:2>;
	# Item Modify
		recipes.remove(PhiloStone);
		recipes.remove(IronRing);
		recipes.remove(LowConvalenceDust);
		recipes.remove(NormalConvalenceDust);
		recipes.remove(HighConvalenceDust);
		# Magic Recipes
			recipes.addShaped(PhiloStone,[[<ore:ingotIron>,<ore:ingotIron>,<ore:ingotIron>],
			                              [OutRouting,<AWWayofTime:voidSigil>,InputRouting],
			                              [<ore:ingotIron>,<ore:ingotIron>,<ore:ingotIron>]]);
			recipes.addShaped(IronRing,[[TerraIngot,TerraIngot,TerraIngot],
										[TerraIngot,null,TerraIngot],
										[TerraIngot,TerraIngot,TerraIngot]]);
			Crucible.addRecipe("ASPECTS",LowConvalenceDust,MagicDust,"metallum 1,permutatio 1");
			recipes.addShaped(NormalConvalenceDust,[[LowConvalenceDust,LowConvalenceDust,LowConvalenceDust],
			                   						[LowConvalenceDust,LifeHolder,LowConvalenceDust],
			                   						[LowConvalenceDust,LowConvalenceDust,LowConvalenceDust]]);
			recipes.addShaped(HighConvalenceDust,[[NormalConvalenceDust,NormalConvalenceDust,NormalConvalenceDust],
			                   					  [NormalConvalenceDust,<AWWayofTime:energyBazooka>,NormalConvalenceDust],
			                   					  [NormalConvalenceDust,NormalConvalenceDust,NormalConvalenceDust]]);
		# Tech Recipes
			recipes.addShaped(PhiloStone,[[IngotBedRock,RoCScreen,IngotBedRock],
			                   			  [IngotBedRock,RoCChip,IngotBedRock],
			                   			  [IngotBedRock,RoCPowerModel,IngotBedRock]]);
			recipes.addShaped(IronRing,[[IngotBedRock,IngotBedRock,IngotBedRock],
										[IngotBedRock,null,IngotBedRock],
										[IngotBedRock,IngotBedRock,IngotBedRock]]);
			RockCrusher.addRecipe(HSLAIngot_NOD,false,false,[LowConvalenceDust],[1.0]);
			recipes.addShaped(NormalConvalenceDust,[[LowConvalenceDust,LowConvalenceDust,LowConvalenceDust],
			                   						[LowConvalenceDust,IngotBedRock,LowConvalenceDust],
			                   						[LowConvalenceDust,LowConvalenceDust,LowConvalenceDust]]);
            recipes.addShaped(HighConvalenceDust,[[NormalConvalenceDust,NormalConvalenceDust,NormalConvalenceDust],
			                   					  [NormalConvalenceDust,RoCHotItem,NormalConvalenceDust],
			                   					  [NormalConvalenceDust,NormalConvalenceDust,NormalConvalenceDust]]);

# Matter Overdrive Modify
	# Val Space
		val TritaniumPlate = <mo:tritanium_plate>;
		val TritaniumIngot = <ore:ingotTraitanium>;
	# Item Modify
		recipes.remove(TritaniumPlate);
		Rolling.addShaped(TritaniumPlate * 4, [[TritaniumIngot, TritaniumIngot, null], 
	                                           [TritaniumIngot, TritaniumIngot, null],
	                                           [null, null, null]]);
