class CreditsResponse {
  int? _id;
  List<Cast>? _cast;

  CreditsResponse({int? id, List<Cast>? cast}) {
    if (id != null) {
      this._id = id;
    }
    if (cast != null) {
      this._cast = cast;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  List<Cast>? get cast => _cast;
  set cast(List<Cast>? cast) => _cast = cast;

  CreditsResponse.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['cast'] != null) {
      _cast = <Cast>[];
      json['cast'].forEach((v) {
        _cast!.add(new Cast.fromJson(v));
      });
    }
  }
}

class Cast {
  bool? _adult;
  int? _gender;
  int? _id;
  String? _knownForDepartment;
  String? _name;
  String? _originalName;
  double? _popularity;
  String? _profilePath;
  int? _castId;
  String? _character;
  String? _creditId;
  int? _order;

  Cast(
      {bool? adult,
      int? gender,
      int? id,
      String? knownForDepartment,
      String? name,
      String? originalName,
      double? popularity,
      String? profilePath,
      int? castId,
      String? character,
      String? creditId,
      int? order}) {
    if (adult != null) {
      this._adult = adult;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (id != null) {
      this._id = id;
    }
    if (knownForDepartment != null) {
      this._knownForDepartment = knownForDepartment;
    }
    if (name != null) {
      this._name = name;
    }
    if (originalName != null) {
      this._originalName = originalName;
    }
    if (popularity != null) {
      this._popularity = popularity;
    }
    if (profilePath != null) {
      this._profilePath = profilePath;
    }
    if (castId != null) {
      this._castId = castId;
    }
    if (character != null) {
      this._character = character;
    }
    if (creditId != null) {
      this._creditId = creditId;
    }
    if (order != null) {
      this._order = order;
    }
  }

  bool? get adult => _adult;
  set adult(bool? adult) => _adult = adult;
  int? get gender => _gender;
  set gender(int? gender) => _gender = gender;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get knownForDepartment => _knownForDepartment;
  set knownForDepartment(String? knownForDepartment) =>
      _knownForDepartment = knownForDepartment;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get originalName => _originalName;
  set originalName(String? originalName) => _originalName = originalName;
  double? get popularity => _popularity;
  set popularity(double? popularity) => _popularity = popularity;
  String? get profilePath => _profilePath;
  set profilePath(String? profilePath) => _profilePath = profilePath;
  int? get castId => _castId;
  set castId(int? castId) => _castId = castId;
  String? get character => _character;
  set character(String? character) => _character = character;
  String? get creditId => _creditId;
  set creditId(String? creditId) => _creditId = creditId;
  int? get order => _order;
  set order(int? order) => _order = order;

  Cast.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _originalName = json['original_name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
    _castId = json['cast_id'];
    _character = json['character'];
    _creditId = json['credit_id'];
    _order = json['order'];
  }

  get fullProfilePath {
    return _profilePath == null
        ? "https://i.stack.imgur.com/GNhxO.png"
        : 'https://image.tmdb.org/t/p/w500${this._profilePath}';
  }
}
