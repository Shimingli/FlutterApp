import 'dart:convert';

/**
 * 这个类改动的太多了 啊啊
 */
class MovieBean {
  final String title;//查询的title
  final String total;//服务器回来的数据
  final String movieImages;
  final String movieName;
  final String castsAcatars;//所有主演的头像的集合
  final String castsName;//所有主演的姓名
  final String ratingAverage;//电影的评分
  final String collect_count;//多少人看过

  MovieBean(this.title, this.total, this.movieImages, this.movieName, this.castsAcatars, this.castsName, this.ratingAverage, this.collect_count);
  static List<MovieBean> datas=new List<MovieBean>();

  static List<MovieBean> decodeData(String data) {
      datas.clear();
      var newData = json.decode(data);
      var title = newData['title'];
      var total = newData['total'];
      var d= newData["subjects"];
      //肯定首先是知道他是一个数组，或者是集合
      for(int i=0;i<d.length;i++){
         datas.add(map(d[i],title,total));
      }
     return datas;
  }

  static MovieBean map(subject,title,total) {
     title=title;
     total="查询到的数据共有："+total.toString()+"条";
     var castsAcatars="";
     var castsName="";
     for(int i=0;i<subject["casts"].length;i++){
       castsName=castsName+" "+subject["casts"][i]["name"];
        var c= subject["casts"][i]["avatars"]["medium"];
           if(i!=subject["casts"].length-1) {
             castsAcatars = castsAcatars + c.toString()+"****";
           }else{
             castsAcatars = castsAcatars + c.toString();
           }

     }
     var ratingAverage= "评分："+subject['rating']['average'].toString();
     //一路改过来
     var collect_count= "一共有："+subject['collect_count'].toString()+"人看过";

    return new MovieBean(title, total, subject["images"]["medium"], subject['title'],
        castsAcatars,
        castsName,
        ratingAverage,
        collect_count);
  }
}
