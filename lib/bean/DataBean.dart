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
      datas.add(forMap(results[i]));
    }
   // print(datas[0].key);
    print(datas[0].message);
    return datas;

  }
  //{key: smooth, value: 1131, means: [{part: adj., means: [光滑的, 流畅的, 柔软的, 温和的，安详的]}, {part: vt., means: [使平滑, 排除，消除, 安抚，平息, 使优雅]}, {part: vi., means: [变平和，变缓和]}, {part: n., means: [平地，平面]}]}
  static DataBean forMap(result) {
    print(result);
    //这是Json的数据
    var key= result["key"];
    var value=result["value"];
    List means= result["means"];
    //var mean = means["means"];
    return null;
  }

}