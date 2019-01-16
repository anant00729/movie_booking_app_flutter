import 'package:json_annotation/json_annotation.dart';
part 'app_models.g.dart';

// Home

@JsonSerializable()
class HomeResponse{

  final String Message;

  final bool Status;

  @JsonKey(name: "shows")
  final List<HomeDataList> movieList;

  HomeResponse({this.Message,this.Status,this.movieList});
  factory HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);

}

@JsonSerializable()
class HomeDataList{

  final int CategoryID;
  final String Title;
  final String SubTitle;

  @JsonKey(name: "Movies")
  final List<Movie> movies;

  HomeDataList({this.CategoryID,this.Title,this.SubTitle, this.movies});
  factory HomeDataList.fromJson(Map<String, dynamic> json) => _$HomeDataListFromJson(json);
}

@JsonSerializable()
class Movie {

  final int ID;
  final String Name;
  final String Image;
  final String Rated;
  final String Year;
  final String Time;
  final int CinemaScheduleID;
  final int ScheduleCount;

  Movie({this.ID,this.Name,this.Image, this.Rated, this.Year, this.Time, this.CinemaScheduleID , this.ScheduleCount});
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}


// MovieDetails
@JsonSerializable()
class MovieDetails{
  final int ID;
  final String HeaderImage;
  final String BannerImage;
  final String Name;
  final String Lang;
  final String Time;
  final String Year;
  final String StoryLine;
  final String Runtime;
  final String IMDBRating;
  final String Rated;

  @JsonKey(name: "Trailers")
  final List<Trailers> trailers;

  @JsonKey(name: "Directors")
  final List<Directors> directors;

  @JsonKey(name: "Actors")
  final List<Actors> actors;

  MovieDetails({this.ID,this.HeaderImage,this.BannerImage,this.Name,this.Lang,this.Time,this.Year,this.StoryLine,this.Runtime,this.IMDBRating,this.Rated,this.trailers,this.directors,this.actors});
  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);


}
@JsonSerializable()
class Trailers{

  final int LinkID;
  final String URI;
  final String MediaType;
  final String MediaThumb;
  final String Media;

  Trailers({this.LinkID,this.URI,this.MediaType,this.Media,this.MediaThumb});
  factory Trailers.fromJson(Map<String, dynamic> json) => _$TrailersFromJson(json);
}
@JsonSerializable()
class Directors{
  final int ID;
  final String Image;
  final String Name;

  Directors({this.ID,this.Image,this.Name});
  factory Directors.fromJson(Map<String, dynamic> json) => _$DirectorsFromJson(json);

}
@JsonSerializable()
class Actors{
  final int ID;
  final String Image;
  final String Name;

  Actors({this.ID,this.Image,this.Name});
  factory Actors.fromJson(Map<String, dynamic> json) => _$ActorsFromJson(json);

}

// Cinema List
@JsonSerializable()
class CinemaList{
  final bool Status;
  final String Message;
  @JsonKey(name: "Cinema")
  final List<Cinema> cinema;

  CinemaList({
    this.Status,this.Message,this.cinema,
  });
  factory CinemaList.fromJson(Map<String, dynamic> json) => _$CinemaListFromJson(json);

}

@JsonSerializable()
class Cinema {


  final String CinemaID;
  final String CinemaName;
  final String Address;
  final int ScreenCount;
  final String OrganizationName;
  // For Date
  final String SchTDate;
  // For Time
  final String Format;
  final String CinemaTimings;


  final int CinemaScheduleID;


  Cinema({this.CinemaID,this.CinemaName,this.Address,this.ScreenCount,this.OrganizationName,this.CinemaScheduleID, this.SchTDate,this.Format,this.CinemaTimings});
  factory Cinema.fromJson(Map<String, dynamic> json) => _$CinemaFromJson(json);
}



// Seat Layout
@JsonSerializable()
class GetSeatLayout{


  final bool Status;
  final String Message;
  final String Row;
  final String Column;
  final String CinemaName;
  final String Address;
  final String Currency;
  final String ScreenName;
  final int ConFee;

  @JsonKey(name: "SeatLayouts")
  final List<SeatLayouts> seatLayouts;

  @JsonKey(name: "SeatTypes")
  final List<SeatTypes> seatTypes;



  GetSeatLayout({this.Status, this.Message, this.Row, this.Column, this.CinemaName, this.Address,this.Currency,this.ScreenName,this.ConFee,this.seatLayouts,this.seatTypes});


  factory GetSeatLayout.fromJson(Map<String, dynamic> json) => _$GetSeatLayoutFromJson(json);


}

@JsonSerializable()
class SeatLayouts{

  @JsonKey(name: "Seats")
  final List<Seats> seats;

  int col_no;
  int row_no;

  SeatLayouts({this.seats});

  factory SeatLayouts.fromJson(Map<String, dynamic> json) => _$SeatLayoutsFromJson(json);

}


@JsonSerializable()
class SeatTypes{

  final int SeatClassPriceID;
  final int SeatClassID;
  final double Price;
  final String Type;
  final String Label;



  SeatTypes({this.SeatClassPriceID,this.SeatClassID,this.Price,this.Type,this.Label});

  factory SeatTypes.fromJson(Map<String, dynamic> json) => _$SeatTypesFromJson(json);
}

@JsonSerializable()
class Seats{

  final String Column;
  final String SeatName;
  int Status;
  final String SeatlayoutID;
  final String SeatClassID;
  final double Price;

  int row_number;


  Seats({this.Column,this.SeatName,this.Status,this.SeatlayoutID,this.SeatClassID,this.Price});

  factory Seats.fromJson(Map<String, dynamic> json) => _$SeatsFromJson(json);

}

