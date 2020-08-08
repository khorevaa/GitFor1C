﻿&НаКлиенте
Перем git;

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	ФайлОбработки = Новый Файл(ОбработкаОбъект.ИспользуемоеИмяФайла);
	ТекущийКаталог = ФайлОбработки.Путь;
	
КонецПроцедуры

&НаКлиенте
Procedure WriteText(FilePath, FileText)
	TextWriter = New TextWriter;
	TextWriter.Open(FilePath, TextEncoding.UTF8);
	TextWriter.Write(FileText);
	TextWriter.Close();
EndProcedure

&НаКлиенте
Процедура Test(AddInId) Экспорт
	
	git = Новый("AddIn." + AddInId + ".GitFor1C");
	
	ВременнаяПапка = ПолучитьИмяВременногоФайла("git");
	УдалитьФайлы(ВременнаяПапка);
	ВременнаяПапка = ВременнаяПапка + "/";
	СоздатьКаталог(ВременнаяПапка);
	СоздатьКаталог(ВременнаяПапка + "include");
	СоздатьКаталог(ВременнаяПапка + "Example");
	СоздатьКаталог(ВременнаяПапка + "Example/Features");
	СоздатьКаталог(ВременнаяПапка + "src");
	СоздатьКаталог(ВременнаяПапка + "tools");
	ВладелецФормы.LocalPath = ВременнаяПапка;
	
	МассивФайлов = Новый Массив;
	МассивФайлов.Добавить("LICENSE");
	МассивФайлов.Добавить("Example.xml");
	МассивФайлов.Добавить("Example/Features/НажатиеМыши.feature");
	МассивФайлов.Добавить("include/ComponentBase.h");
	МассивФайлов.Добавить("include/types.h");
	МассивФайлов.Добавить("src/AddInBase.cpp");
	МассивФайлов.Добавить("src/AddInBase.h");
	МассивФайлов.Добавить("src/json.hpp");
	МассивФайлов.Добавить("tools/Compile.os");
	МассивФайлов.Добавить("tools/Decompile.os");
	
	git.init(ВременнаяПапка);
	Для каждого ИмяФайла Из МассивФайлов Цикл
		КопироватьФайл(ТекущийКаталог + ИмяФайла, ВременнаяПапка + ИмяФайла);
		git.add(ИмяФайла);
	КонецЦикла;
	git.commit("Инициализация");
	
	ИмяФайла = ВременнаяПапка + "LICENSE";
	ТекстовыйДокумент = новый ТекстовыйДокумент;
	ТекстовыйДокумент.Прочитать(ИмяФайла, КодировкаТекста.UTF8);
	ТекстовыйДокумент.УдалитьСтроку(12);
	ТекстовыйДокумент.УдалитьСтроку(12);
	ТекстовыйДокумент.УдалитьСтроку(12);
	ТекстовыйДокумент.ВставитьСтроку(24, ЧислоПрописью(51243));
	ТекстовыйДокумент.ВставитьСтроку(25, ЧислоПрописью(24565));
	ТекстовыйДокумент.Записать(ИмяФайла, КодировкаТекста.UTF8);
	
	JsonText = git.status();
	
КонецПроцедуры