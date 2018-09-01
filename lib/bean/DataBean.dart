import 'dart:convert';


class DataBean{
   //final String key;
   final List<String> message;
   DataBean( this.message);
   //转化data
  static List<DataBean> decodeData(String data){
    List<DataBean> datas=new List<DataBean>();

    var newData=json.decode(data);
    var results= newData['message'];
    for(int i=0;i<results.length;i++){
      datas.add(results[i]);
    }
   // print(datas[0].key);
    print(datas[0].message);
    return datas;

  }

}