
import 'package:words_3000_puzzle/data/dto/category_dto.dart';
import 'package:words_3000_puzzle/data/dto/word_dto.dart';

abstract class CategoryRepository {
  List<CategoryDto> getAllCategories();
  Future<CategoryDto> getCategory(String id);
  Future addUpdateCategory(String id, CategoryDto category);
  Future deleteCategory(String id);
}
