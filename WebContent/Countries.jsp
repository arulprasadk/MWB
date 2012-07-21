<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%

Map<String,String[]> countriesByMap = new HashMap();
countriesByMap.put("India", new String[] {"Mumbai","Chennai"});
countriesByMap.put("USA", new String[] {"New York","New Jersy"});
countriesByMap.put("UK", new String[] {"London","Bristol"});

StringBuilder citiesByCountryJSON = new StringBuilder("{");
for(Map.Entry<String,String[]> entry : countriesByMap.entrySet())
{
	citiesByCountryJSON.append("\"" + entry.getKey() + "\" : [");
	for(String value : entry.getValue())
	{
		citiesByCountryJSON.append("\"" + value + "\",");
	}
	citiesByCountryJSON.delete(citiesByCountryJSON.length()-1,citiesByCountryJSON.length());
	citiesByCountryJSON.append(" ],");
}
citiesByCountryJSON.delete(citiesByCountryJSON.length()-1,citiesByCountryJSON.length());

StringBuilder countriesBuilder = new StringBuilder(", \"countries\" : [");


for(String country : countriesByMap.keySet())
{
	countriesBuilder.append("\"" + country + "\",");
}
countriesBuilder.delete(countriesBuilder.length()-1,countriesBuilder.length());
countriesBuilder.append(" ]");
citiesByCountryJSON.append(countriesBuilder.toString());
citiesByCountryJSON.append("}");
out.println(citiesByCountryJSON.toString());
System.out.println(citiesByCountryJSON.toString());
%>
