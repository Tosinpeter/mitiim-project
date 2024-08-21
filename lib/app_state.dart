import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _notifications = prefs.getBool('ff_notifications') ?? _notifications;
    });
    _safeInit(() {
      _email = prefs.getBool('ff_email') ?? _email;
    });
    _safeInit(() {
      _sms = prefs.getBool('ff_sms') ?? _sms;
    });
    _safeInit(() {
      _rangeFilterCustomer =
          prefs.getDouble('ff_rangeFilterCustomer') ?? _rangeFilterCustomer;
    });
    _safeInit(() {
      _userType = prefs.containsKey('ff_userType')
          ? deserializeEnum<PublishedBy>(prefs.getString('ff_userType'))
          : _userType;
    });
    _safeInit(() {
      _showList = prefs.getBool('ff_showList') ?? _showList;
    });
    _safeInit(() {
      _rangeFilterProvider =
          prefs.getDouble('ff_rangeFilterProvider') ?? _rangeFilterProvider;
    });
    _safeInit(() {
      _filterGenderProvider = prefs.containsKey('ff_filterGenderProvider')
          ? deserializeEnum<Gender>(prefs.getString('ff_filterGenderProvider'))
          : _filterGenderProvider;
    });
    _safeInit(() {
      _filterRatingProvider = prefs.containsKey('ff_filterRatingProvider')
          ? deserializeEnum<FilterRatingProvider>(
              prefs.getString('ff_filterRatingProvider'))
          : _filterRatingProvider;
    });
    _safeInit(() {
      _selectedLanguage =
          prefs.getString('ff_selectedLanguage') ?? _selectedLanguage;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _clickresto = false;
  bool get clickresto => _clickresto;
  set clickresto(bool value) {
    _clickresto = value;
  }

  bool _Test = false;
  bool get Test => _Test;
  set Test(bool value) {
    _Test = value;
  }

  bool _clickAide = false;
  bool get clickAide => _clickAide;
  set clickAide(bool value) {
    _clickAide = value;
  }

  bool _ClickBeauty = false;
  bool get ClickBeauty => _ClickBeauty;
  set ClickBeauty(bool value) {
    _ClickBeauty = value;
  }

  bool _clickSav = false;
  bool get clickSav => _clickSav;
  set clickSav(bool value) {
    _clickSav = value;
  }

  bool _clickcours = false;
  bool get clickcours => _clickcours;
  set clickcours(bool value) {
    _clickcours = value;
  }

  bool _clickService = false;
  bool get clickService => _clickService;
  set clickService(bool value) {
    _clickService = value;
  }

  bool _clickConstr = false;
  bool get clickConstr => _clickConstr;
  set clickConstr(bool value) {
    _clickConstr = value;
  }

  bool _clickDemenag = false;
  bool get clickDemenag => _clickDemenag;
  set clickDemenag(bool value) {
    _clickDemenag = value;
  }

  bool _clickLivraison = false;
  bool get clickLivraison => _clickLivraison;
  set clickLivraison(bool value) {
    _clickLivraison = value;
  }

  bool _clickservice = false;
  bool get clickservice => _clickservice;
  set clickservice(bool value) {
    _clickservice = value;
  }

  bool _clickoffre = false;
  bool get clickoffre => _clickoffre;
  set clickoffre(bool value) {
    _clickoffre = value;
  }

  PublishedBy? _publishedBy = PublishedBy.provider;
  PublishedBy? get publishedBy => _publishedBy;
  set publishedBy(PublishedBy? value) {
    _publishedBy = value;
  }

  PublishCategory? _selectedCategory;
  PublishCategory? get selectedCategory => _selectedCategory;
  set selectedCategory(PublishCategory? value) {
    _selectedCategory = value;
  }

  bool _notifications = false;
  bool get notifications => _notifications;
  set notifications(bool value) {
    _notifications = value;
    prefs.setBool('ff_notifications', value);
  }

  bool _email = false;
  bool get email => _email;
  set email(bool value) {
    _email = value;
    prefs.setBool('ff_email', value);
  }

  bool _sms = false;
  bool get sms => _sms;
  set sms(bool value) {
    _sms = value;
    prefs.setBool('ff_sms', value);
  }

  PublishCategory? _categoryFilterCustomer;
  PublishCategory? get categoryFilterCustomer => _categoryFilterCustomer;
  set categoryFilterCustomer(PublishCategory? value) {
    _categoryFilterCustomer = value;
  }

  double _rangeFilterCustomer = 5.0;
  double get rangeFilterCustomer => _rangeFilterCustomer;
  set rangeFilterCustomer(double value) {
    _rangeFilterCustomer = value;
    prefs.setDouble('ff_rangeFilterCustomer', value);
  }

  int _priceFilterCustomer = 100;
  int get priceFilterCustomer => _priceFilterCustomer;
  set priceFilterCustomer(int value) {
    _priceFilterCustomer = value;
  }

  int _ratingFilterCustomer = 5;
  int get ratingFilterCustomer => _ratingFilterCustomer;
  set ratingFilterCustomer(int value) {
    _ratingFilterCustomer = value;
  }

  SortBy? _sortByCustomer = SortBy.assending;
  SortBy? get sortByCustomer => _sortByCustomer;
  set sortByCustomer(SortBy? value) {
    _sortByCustomer = value;
  }

  PublishedBy? _userType = PublishedBy.client;
  PublishedBy? get userType => _userType;
  set userType(PublishedBy? value) {
    _userType = value;
    value != null
        ? prefs.setString('ff_userType', value.serialize())
        : prefs.remove('ff_userType');
  }

  List<PublishCategory> _homeFilters = [];
  List<PublishCategory> get homeFilters => _homeFilters;
  set homeFilters(List<PublishCategory> value) {
    _homeFilters = value;
  }

  void addToHomeFilters(PublishCategory value) {
    homeFilters.add(value);
  }

  void removeFromHomeFilters(PublishCategory value) {
    homeFilters.remove(value);
  }

  void removeAtIndexFromHomeFilters(int index) {
    homeFilters.removeAt(index);
  }

  void updateHomeFiltersAtIndex(
    int index,
    PublishCategory Function(PublishCategory) updateFn,
  ) {
    homeFilters[index] = updateFn(_homeFilters[index]);
  }

  void insertAtIndexInHomeFilters(int index, PublishCategory value) {
    homeFilters.insert(index, value);
  }

  bool _showList = false;
  bool get showList => _showList;
  set showList(bool value) {
    _showList = value;
    prefs.setBool('ff_showList', value);
  }

  bool _serviceToggle = false;
  bool get serviceToggle => _serviceToggle;
  set serviceToggle(bool value) {
    _serviceToggle = value;
  }

  double _rangeFilterProvider = 5.0;
  double get rangeFilterProvider => _rangeFilterProvider;
  set rangeFilterProvider(double value) {
    _rangeFilterProvider = value;
    prefs.setDouble('ff_rangeFilterProvider', value);
  }

  int _priceFilterProvider = 100;
  int get priceFilterProvider => _priceFilterProvider;
  set priceFilterProvider(int value) {
    _priceFilterProvider = value;
  }

  Gender? _filterGenderProvider;
  Gender? get filterGenderProvider => _filterGenderProvider;
  set filterGenderProvider(Gender? value) {
    _filterGenderProvider = value;
    value != null
        ? prefs.setString('ff_filterGenderProvider', value.serialize())
        : prefs.remove('ff_filterGenderProvider');
  }

  FilterRatingProvider? _filterRatingProvider;
  FilterRatingProvider? get filterRatingProvider => _filterRatingProvider;
  set filterRatingProvider(FilterRatingProvider? value) {
    _filterRatingProvider = value;
    value != null
        ? prefs.setString('ff_filterRatingProvider', value.serialize())
        : prefs.remove('ff_filterRatingProvider');
  }

  PublishCategory? _categoryFilterProvider;
  PublishCategory? get categoryFilterProvider => _categoryFilterProvider;
  set categoryFilterProvider(PublishCategory? value) {
    _categoryFilterProvider = value;
  }

  PriceFilterType? _priceFilterTypeClient = PriceFilterType.fixed;
  PriceFilterType? get priceFilterTypeClient => _priceFilterTypeClient;
  set priceFilterTypeClient(PriceFilterType? value) {
    _priceFilterTypeClient = value;
  }

  PriceFilterType? _priceFilterTypeProvider = PriceFilterType.hourly;
  PriceFilterType? get priceFilterTypeProvider => _priceFilterTypeProvider;
  set priceFilterTypeProvider(PriceFilterType? value) {
    _priceFilterTypeProvider = value;
  }

  String _selectedLanguage = '';
  String get selectedLanguage => _selectedLanguage;
  set selectedLanguage(String value) {
    _selectedLanguage = value;
    prefs.setString('ff_selectedLanguage', value);
  }

  String _Compte = 'male';
  String get Compte => _Compte;
  set Compte(String value) {
    _Compte = value;
  }

  String _filterGender = 'acc';
  String get filterGender => _filterGender;
  set filterGender(String value) {
    _filterGender = value;
  }

  String _ratingOrder = '';
  String get ratingOrder => _ratingOrder;
  set ratingOrder(String value) {
    _ratingOrder = value;
  }

  double _ratingbar = 3.0;
  double get ratingbar => _ratingbar;
  set ratingbar(double value) {
    _ratingbar = value;
  }

  bool _ClickLaos = false;
  bool get ClickLaos => _ClickLaos;
  set ClickLaos(bool value) {
    _ClickLaos = value;
  }

  AvailabilityStruct _Availability = AvailabilityStruct();
  AvailabilityStruct get Availability => _Availability;
  set Availability(AvailabilityStruct value) {
    _Availability = value;
  }

  void updateAvailabilityStruct(Function(AvailabilityStruct) updateFn) {
    updateFn(_Availability);
  }

  String _userasa = '';
  String get userasa => _userasa;
  set userasa(String value) {
    _userasa = value;
  }

  LatLng? _lat = const LatLng(17.9801234, 102.6145617);
  LatLng? get lat => _lat;
  set lat(LatLng? value) {
    _lat = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
