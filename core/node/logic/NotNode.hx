package core.node.logic;
import core.datum.Datum;
import core.graph.Graph;
import core.slot.Slot;
/**
 * ...
 * @author MibuWolf
 */
class NotNode extends LogicBaseNode
{

	private var slotCondition:String;
	
	public function new(owner:Graph) 
	{
		super(owner);
		
		slotCondition = "Condition";
		name = "Not";
		AddDatumSlot(Slot.INITIALIZE_SLOT(slotCondition, SlotType.DataIn),Datum.INITIALIZE_BOOL(name));
	}
	
	
	// 评价逻辑(需要重载)
	override public function Evaluate():Bool
	{
		var data:Datum = GetSlotData(slotCondition);
		
		if (data == null)
			return false;
		
		if(data.GetValue())
			return false;
			
		return true;
	}
	
}