class Taskmodel{
  String id;
  String title;
  String decription;
  int date;
  bool isdone;
  Taskmodel({this.id="",required this.title,required this.decription,required this.date, this.isdone=false});


  Taskmodel.FromJson(Map<String,dynamic>json) :
        this
      (
             id: json['id'],

             title: json['title'],
             decription: json['description'],
             date: json['date'],
             isdone: json['isdone']
  );
    Map<String,dynamic>toJason(){
      return{
        "id":id,
        "title":title,
        "description": decription,
        "date": date,
        "isdone": isdone,

      };

    }

}