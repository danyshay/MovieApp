import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MovieBloc {
  final _repository = Repository();
  final _fetchMovie = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _fetchMovie.stream;

  fetchAllMovies() async{
    ItemModel itemModel = await _repository.fetchAllMovies();
    _fetchMovie.sink.add(itemModel);
  }

  dispose(){
    _fetchMovie.close();
  }
}

final bloc = MovieBloc();