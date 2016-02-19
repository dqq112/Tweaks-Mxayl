/*
		MineTweaker Script
		Create By.Indexyz
		2016-2-15
		Version.Debug.0
 */
# Import Space
	import minetweaker.item.IItemStack;
	import mods.nei.NEI;
	import mods.thaumcraft.Crucible;
	import mods.thaumcraft.Arcane;
	import mods.thaumcraft.Infusion;

# Val Space
	val IronPlate   = <Railcraft:part.plate>;
	val SteelPlate  = <Railcraft:part.plate:1>;
	val TinPlate    = <Railcraft:part.plate:2>;
	val CopperPlate = <Railcraft:part.plate:3>;
	val IronWrench  = <OpenBlocks:wrench>;
	val Redstone    = <ore:dustRedstone>;
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
# StorageSilo Modify
	recipes.remove(<storageSilo:storagesilo>);
	recipes.addShaped(<storageSilo:storagesilo>,[[<ore:chest>,<ore:chest>,<ore:chest>],
												 [<ore:chest>,IronWrench,<ore:chest>],
												 [<ore:chest>,<ore:chest>,<ore:chest>]]);
	mods.thaumcraft.Arcane.addShaped("ASPECTS", <storageSilo:storagesilo>, "ordo 8, aer 2", [[<ore:chest>,<ore:chest>,<ore:chest>],
																						 	 [<ore:chest>,IronWrench,<ore:chest>],
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
# RotaryCraft Modify
	# Val Space
	 	val CraftingTable   = <RotaryCraft:rotarycraft_item_machine:75>;
	 	val RoCBlastFurnace = <RotaryCraft:rotarycraft_item_machine:45>;
	 	val HASAAxis 		= <RotaryCraft:rotarycraft_item_shaftcraft:2>;
	 	val HASAGear 		= <RotaryCraft:rotarycraft_item_shaftcraft:4>;
	# Machine Recipes
		recipes.remove(CraftingTable);
		recipes.addShaped(CraftingTable,[[null,IronWrench,null],
										 [IronWrench,MachineBlock,IronWrench],
										 [null,IronWrench,null]]);
		recipes.remove(RoCBlastFurnace);
		recipes.addShaped(RoCBlastFurnace,[[<Magneticraft:heat_resistance>,<Magneticraft:heat_resistance>,<Magneticraft:heat_resistance>],
										   [Diode,<minecraft:furnace>,Diode],
										   [<Magneticraft:heat_resistance>,<Magneticraft:heat_resistance>,<Magneticraft:heat_resistance>]]);
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
	# Item Recipes
		recipes.remove(Altar);
		Infusion.addRecipe("ASPECTS", <Thaumcraft:blockMetalDevice>, MysticalPetal, "victus 64, lux 64", Altar, 5);
