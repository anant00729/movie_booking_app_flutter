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
  final String Status;
  final String Message;
  @JsonKey(name: "Cinema")
  final Cinema cinema;

  CinemaList({
    this.Status,this.Message,this.cinema,
  });
  factory CinemaList.fromJson(Map<String, dynamic> json) => _$CinemaListFromJson(json);

}

@JsonSerializable()
class Cinema {
  final int CinemaID;
  final String CinemaName;
  final String Address;
  final int ScreenCount;
  final int CinemaScheduleID;
  final String OrganizationName;

  Cinema({this.CinemaID,this.CinemaName,this.Address,this.ScreenCount,this.CinemaScheduleID,this.OrganizationName});
  factory Cinema.fromJson(Map<String, dynamic> json) => _$CinemaFromJson(json);
}

