if (!hasInterface OR isServer) exitwith {};
waitUntil {uiSleep 0.03; !isNull player && player isEqualTo player};
if (player diarySubjectExists "rules")exitwith{};

//player createDiarySubject ["policerules","Закон/Полиция"];
//player createDiarySubject ["illegalitems","Нелегал"];

player createDiarySubject ["island","Остров"];
player createDiarySubject ["resourse","Ресурсы"];
player createDiarySubject ["serverrules","Правила"];
player createDiarySubject ["controls","Управление"];

	player createDiaryRecord["island", 
	[
		"资源价格",
		"
		您可以通过玩家菜单查看当前价格和合法性（Y） <br/>
		v<br/><br/>"
	]];

	player createDiaryRecord["island",
		[
			"服务器新闻",
				"关注QQ群里的消息: 123456789000<br/><a href='http://sunriserp.ru/' size='1.6' underline='true' color='#83dbff' align='center'>sunriserp.ru</t>"
		]
	];
	
	player createDiaryRecord ["resourse", 
	[
		"资源",
		"
		资源, 地图上标记的 <font color='#800080'>紫色</font> 颜色是合法的<br/>
		资源, 地图上标记的 <font color='#FFA500'>橙色的</font> 颜色是非法的.<br/><br/>"
	]];
	
	player createDiaryRecord ["resourse", 
	[
		"Алкоголь",
		"
		威士忌，布拉加和自酿酒是在利口酒厂生产的<br/>
		啤酒厂里的“啤酒”<br/>
		由沙子制成的玻璃在酒精装瓶点被加工成瓶子<br/><br/>
		注意！为了生产某种酒精，你需要相同数量的成分。例如，生产10威士忌需要10酵母和10黑麦<br/><br/>
		<br/>
		酵母+黑麦=威士忌-->威士忌+瓶子=一瓶威士忌出售<br/>
		酵母+啤酒花=啤酒-->啤酒+瓶子=一瓶啤酒出售 <br/>
		酵母+布拉加=烈酒-->烈酒+瓶子=烈酒出售 <br/>
		玉米粉+啤酒花=布拉加（酿酒所需） <br/>
		用沙子制成的玻璃必须回收成瓶子<br/><br/>
		啤酒和威士忌是合法生产的<br/>"
	]];

	player createDiaryRecord ["serverrules",
		[
			"服务器规则",
				"在sunriserp.ru论坛上仔细研究服务器规则<br/><br/>对规则的无知不能免除责任！"
		]
	];

	player createDiaryRecord ["controls",
		[
			"按键介绍",
				"Y：打开播放器菜单<br/>
                一：打开玩家物品栏<br/>
				U：打开/关闭车辆或房屋<br/>
				F：警笛（警用）<br/>
				T：车身/后备箱<br/>
				TAB：设置热键<br/>
				鼠标左键：如果您手中有必要的工具，则提取资源<br/>
				左 Shift + R：按住（警察）/所有人昏迷后链接<br/>
				左 Shift + G：击晕，击倒（对于公民，战利品）在拿着武器时起作用<br/>
				左Windows：进入操作菜单：提款机、修车、取钱、管理相关玩家、管理房屋等。 （必要时设置：ESC->settings->control->自定义设置->Assign button to action 10）<br/>
				左Windows+T：取钱和物品（如果左Windows不起作用）<br/>
				左Shift + L：激活闪烁的信标（警察）<br/>
				左Shift + V：举手投降/放下手<br/>
				左Shift + END：使用耳塞（静音车辆和射击声音，不影响语音聊天）<br/>
				左 Shift + P = 打开手机<br/>
				左 Shift + O = 在手机中打开紧急拨号 <br/>
				左 Shift + I = 通缉（警察和 EMS）<br/>
				左 Shift + Num 1：舞蹈菜单<br/>
				左 Shift + Num 2：手势菜单 1<br/>
				左 Shift + Num 3：手势菜单 2<br/>
				"
		]
	];

			"对讲机",
				"详细说明可在特遣部队 mod 的网站上找到：http://radio.task-force.ru/<br/><br/>
TeamSpeak 中的通话按钮 = 直接讲话。<br/>
大写锁定 = 对讲机。<br/>
CTRL + Caps Lock = 使用远程无线电通话。<br/>
CTRL + P = 打开个人对讲机界面（对讲机必须在库存槽中）。如果您有多个对讲机，您可以选择您需要的一个。也可以将无线电设置为活动的（将用于传输的无线电）<br/>
ALT + P = 打开远程无线电接口（远程无线电必须佩戴在背面，或者您必须在车内为驾驶员、炮手、指挥官或副驾驶）。如果有多个收音机可用，系统将提示您进行选择。您也可以将其中一个设置为活动状态。<br/>"
				"
		]
	];