# Survival analysis
Survival analysis is concerned with studying the time between entry to a study and a subsequent event. Originally the analysis was concerned with time from treatment until death, hence the name, but survival analysis is applicable to many areas as well as mortality.
## 基本术语
1. Event（事件）：在癌症研究中，事件可以是Relapse，Progression以及Death  
2. Survival time（生存时间）：一般指某个事件的开始到终止这段事件，如癌症研究中的疾病确诊到缓解或者死亡，其中有几个比较重要的肿瘤临床试验终点：
DFS：disease free survival,无病生存期  
RFS: relapse free survival，无复发生存期  
PFS：progression Free Survival,无进展生存期  
DSS：disease-specific survival，疾病特异性生存期  
OS:  overall survival,整体生存期  
3. Censoring（删失）：这经常会在临床资料中看到，生存分析中也有其对应的参数，一般指不是由死亡引起的的数据丢失，可能是失访，可能是非正常原因退出，可能是时间终止而事件未发等等，一般在展示时以‘+’号显示  
left censored（左删失）：只知道实际生存时间小于观察到的生存时间  
right censored（右删失）：只知道实际生存时间大于观察到的生存时间  
interval censored（区间删失）：只知道实际生存时间在某个时间区间范围内  
