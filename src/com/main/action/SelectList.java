package com.main.action;

@ResponseBody
@RequestMapping(value="/reqAjax2", method=RequestMethod.GET)
public Map<String,String> reqAjax2(String name, String phone) {
    System.out.println("ajax 요청 도착!"+name +"," + phone);
    Map<String,String> map = new HashMap<String,String>();
    map.put("name",name);
    map.put("phone",phone);
    return map;
}