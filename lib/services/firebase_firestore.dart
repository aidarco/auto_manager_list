

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/problem_model.dart';

class FirebaseFirestoreService
{
  final db = FirebaseFirestore.instance;
  final bodyKeywords = ["кузов","рыжик","гниет", "окно", "открываются", "закрываются", "бампер", "окно", "крыло", "дверь", "капот", "фара", "фонарь", "порог", "стекло", "крыша", "панель", "зеркало", "капсула", "крышка", "боковина", "салон", "поручень", "молдинг", "решетка", "дверца", "корпус", "багажник", "замок", "молдинг", "порог", "внешность", "каркас", "защита", "крепление", "поручень", "подножка", "облицовка", "внутренность", "накладка", "опора", "замаскировать", "порог", "пластина", "полировать", "покраска", "шлифовка", "петля", "замок", "уплотнитель", "металл", "пластик", "стекло", "вмятина", "царапина", "скол", "ржавчина", "коррозия", "трещина", "деформация","вибрация", "покраска", "рихтовка", "сварка", "корпус", "каркас", "рама", "шасси", "платформа", "лонжерон", "поперечина", "балка", "усилитель", "опора", "подрамник", "накладка", "кнопка", "ручка", "механизм", "устройство", "система", "кузовной", "бамперный", "крыльевой", "дверной", "капотный", "оптический", "стеклянный", "зеркальный", "люковый", "шинный", "крепёжный", "соединительный", "защитный", "деформированный", "повреждённый", "ремонтный", "ABS", "ПВХ", "LED", "HID", "TPMS", "ESP", "ABS", "EBD", "body", "bumper", "fender", "door", "hood", "headlight", "taillight", "glass", "mirror", "sunroof", "tire", "antenna", "molding", "trim", "spoiler", "towbar", "shield", "mudguard", "hinge", "lock", "seal", "metal", "plastic", "glass", "dent", "scratch", "chip", "rust", "corrosion", "crack", "deformation", "breakage", "play", "binding", "creak", "knock", "vibration", "replacement", "repair", "recovery", "painting", "bodywork", "welding"];
  final engineKeywords = ["мотор", "чип", "двигатель", "коробка", "масло", "фильтр", "выхлоп", "турбо", "гудит", "шумит", "вибрация", "троит", "детонация", "перегрев", "запуск", "тяга", "мощность", "расход", "топливо", "бензин", "дизель", "газ", "инжектор", "карбюратор", "катализатор", "лямбда-зонд", "датчик", "компьютер", "ЭБУ", "прошивка", "диагностика", "ремонт", "замена", "сервис", "гарантия", "блок", "цилиндр", "поршень", "кольцо", "коленвал", "распредвал", "шатун", "вкладыш", "клапан", "гидрокомпенсатор", "маслосъемный колпачок", "головка блока", "прокладка", "коллектор", "впуск", "выпуск", "турбина", "компрессор", "интеркулер", "ремень", "цепь", "насос", "генератор", "стартер", "аккумулятор", "охлаждение", "радиатор", "патрубок", "термостат", "вентилятор", "датчик", "кондиционер", "система", "устройство", "механизм", "деталь", "компонент", "агрегат", "узел", "запчасть", "аксессуар", "тюнинг", "модификация", "улучшение", "доработка", "форсирование", "чип-тюнинг", "свап", "капитальный ремонт", "переборка", "расточка", "гильзовка", "хонингование", "шлифовка", "опрессовка", "дефектовка", "разборка", "сборка", "мойка", "чистка", "смазка", "регулировка", "настройка", "обслуживание", "уход"];
  final chassisKeywords = ["шасси", "колесо", "подвеска", "амортизаторы", "едут", "едет" "крутятся", "пружины", "стабилизаторы", "рычаги", "подшипники", "передний мост", "задний мост", "рулевой механизм", "рулевая рейка", "рейка", "рулевая тяга", "рулевые наконечники", "рулевой карданчик", "рулевая колонка", "регулировка руля", "рулевое колесо", "тяга рулевая", "тяга рулевая регулируемая", "подшипник рулевого карданчика", "подушка рулевой рейки", "амортизатор рулевой колонки", "рулевой вал", "рулевая тяга", "рулевая тяга регулируемая", "рулевая тяга регулировочная", "переключатель рулевого столба", "переключатель рулевого вала", "рулевой трапециид", "шаровая опора", "стойка стабилизатора", "балка стабилизатора", "тяга стабилизатора", "подшипник стабилизатора", "датчик положения руля", "манжета рулевой рейки", "крестовина рулевого вала", "сальник рулевого вала", "стопорное кольцо рулевого вала", "передняя панель", "задняя панель"];

  String getCategory(String description) {
    final lowerDescription = description.toLowerCase();
    if (bodyKeywords.any(lowerDescription.contains)) {
      return "body";
    } else if (chassisKeywords.any(lowerDescription.contains)) {
      return "chassis";
    } else if (engineKeywords.any(lowerDescription.contains)){
      return "engine";
    }
    else {
      return "other";
    }
  }
  Future<void> createProblem({required String description})
  async {
    try {
      final problem = db.collection(getCategory(description)).doc();
      final data = {
        'id': problem.id,
        'description': description,
      };
      await problem.set(data);
    }
    catch(e)
    {
      print("Проблема - - - - - - - - - -- - - -- - - -" + e.toString());
    }
  }

  Stream<List<ProblemModel>> getProblems() {
    final problems = db.collection("body").snapshots().map(
          (snapshot) => snapshot.docs
          .map((e) => ProblemModel.fromJson(e.data()))
          .toList(),
    );

    return problems;
  }

  Stream<List<ProblemModel>> getProblemsEngine() {
    final problems = db.collection("engine").snapshots().map(
          (snapshot) => snapshot.docs
          .map((e) => ProblemModel.fromJson(e.data()))
          .toList(),
    );

    return problems;
  }

  Stream<List<ProblemModel>> getProblemsEngineChassis() {
    final problems = db.collection("chassis").snapshots().map(
          (snapshot) => snapshot.docs
          .map((e) => ProblemModel.fromJson(e.data()))
          .toList(),
    );

    return problems;
  }


  Stream<List<ProblemModel>> getProblemsOther() {
    final problems = db.collection("other").snapshots().map(
          (snapshot) => snapshot.docs
          .map((e) => ProblemModel.fromJson(e.data()))
          .toList(),
    );

    return problems;
  }

  removeFromDB(String id, String category) async {
    print("Deleting document with ID: $id");
    await db.collection(category).doc(id).delete();
  }

  Future<void> moveProblem({required String id,required String category ,required String newCategory}) async {
    try {
      final docRef = db.collection(category).doc(id);
      final data = await docRef.get();
      if (data.exists) {
        await db.collection(newCategory).doc(id).set(data.data() as Map<String, dynamic>);
        await docRef.delete();
      } else {
        print("Проблема с ID $id не найдена");
      }
    } catch (e) {
      print("Проблема при перемещении: $e");
    }
  }
  Future<void> checkAndMoveOtherProblems() async {
    try {
      final otherProblems = await db.collection("other").get();
      for (var doc in otherProblems.docs) {
        final description = doc["description"];
        final category = getCategorys(description);
        if (category != "other") {
          await moveProblem(id: doc.id, category: "other", newCategory: category);
        }
      }
    } catch (e) {
      print("Проблема при проверке other: $e");
    }
  }

  String getCategorys(String description) {
    final lowerDescription = description.toLowerCase();

    // Функция для проверки сходства слов
    bool areSimilar(String word1, String word2) {
      final similarityThreshold = 0.4; // Порог сходства

      // Вычисляем длину более короткой строки
      final minLength = word1.length < word2.length ? word1.length : word2.length;

      // Вычисляем количество совпадающих символов
      int commonChars = 0;
      for (int i = 0; i < minLength; i++) {
        if (word1[i] == word2[i]) {
          commonChars++;
        }
      }

      // Вычисляем коэффициент сходства
      final similarity = commonChars / minLength;

      // Возвращаем результат сравнения
      return similarity >= similarityThreshold;
    }

    // Разбиваем описание на отдельные слова
    final words = lowerDescription.split(' ');

    // Проверяем каждое слово для категории "body"
    for (String word in words) {
      for (String keyword in bodyKeywords) {
        if (areSimilar(word, keyword)) {
          return "body";
        }
      }
    }

    // Проверяем каждое слово для категории "engine"
    for (String word in words) {
      for (String keyword in engineKeywords) {
        if (areSimilar(word, keyword)) {
          return "engine";
        }
      }
    }

    // Проверяем каждое слово для категории "chassis"
    for (String word in words) {
      for (String keyword in chassisKeywords) {
        if (areSimilar(word, keyword)) {
          return "chassis";
        }
      }
    }

    // Если ни одно слово не совпало, возвращаем "other"
    return "other";
  }


  }
