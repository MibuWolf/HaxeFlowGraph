package reflectclass;
import core.datum.Datum;
/**
 * ...
 * @author MibuWolf
 */
class TriggerInfo 
{

	// 所属类类名
	private var className:String;
	// 方法名
	private var methodName:String;
	// 输入参数类型及默认值
	private var params:Array<Datum>;
	
	// 输入参数个数
	private var inputCount:Int = 0;
	
	private var tips:String;
	
	public function new(cName:String, mName:String) 
	{
		className = cName;
		methodName = mName;
		inputCount = 0;
		
		params = new Array<Datum>();
		
	}
	
	public function GetTips():String
	{
		return tips;
	}
	
	public function SetTips(tip:String):Void
	{
		this.tips = tip;
	}
	
	
	// 获取类名
	public function GetClassName():String
	{
		return className;
	}
	
	
	// 获取方法名
	public function GetMethodName():String
	{
		return methodName;
	}
	
	// 添加输入参数
	public function AddParam(param:Datum):Void
	{
		if(param != null)
			params.push(param);
		
		inputCount = 0;
		for (param in params)
		{
			if (param.GetValue() != null)
				inputCount ++;
		}
	}
	
	// 设置参数值
	public function SetParamValue(index:Int, value:Any):Void
	{
		if (index < 0)
			return;
			
		var datum:Datum = params[index];
		
		if (datum != null)
		{
			datum.SetValue(value);
		}
	}
	
	
	// 获取参数值
	public function GetParamValue(index:Int):Any
	{
		if (index < 0)
			return null;	
			
		var datum:Datum = params[index];
		
		if (datum == null)
			return null;
			
		return datum.GetValue();
	}
	
	
	public function SetDefaultEntityID(entityID:Int):Void
	{
		for (param in params)
		{
			if (param.GetDatumType() == DatumType.USERID) 
			{
				param.SetValue(ReflectHelper.GetInstance().CreateLogicData("userid",entityID));
			}
		}
	}
	
	
	// 获取所有参数
	public function GetAllParam():Array<Datum>
	{
		return params;
	}
	
	
	// 获取参数类型
	public function GetParamType(name:String):DatumType
	{
		for (param in params)
		{
			if (param != null && param.GetName() == name)
			{
				return param.GetDatumType();
			}
		}
		
		return DatumType.INVALID;
	}
	
	
	// 设置参数值
	public function SetParam(name:String, value:Any):Void
	{
		for (param in params)
		{
			if (param != null && param.GetName() == name)
			{
				param.SetValue(value);
			}
		}
	}
	
	
	
	// 克隆数据
	public function Clone():TriggerInfo
	{
		var info:TriggerInfo = new TriggerInfo(className, methodName);
		
		for (param in params)
		{
			info.AddParam(param.Clone());
		}
		
		info.inputCount = inputCount;
		
		return info;
	}
	
	
	// 获取输入参数
	public function GetInputParamCount():Int
	{
		return inputCount;
	}
}