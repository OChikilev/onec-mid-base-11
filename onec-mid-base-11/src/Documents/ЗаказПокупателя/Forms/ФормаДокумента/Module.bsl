
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	//{{ Используем ОбщиеМодули: ДЗ_РаботаСФормами
	// Создаем группу скидка.  
	//Добавляем: Поле согласованная скидка и Кнопку пересчитать	
	ДЗ_РаботаСФормами.СоздатьГруппуСкидка(Элементы.ГруппаШапкаЛево, Элементы);	
	НаполнитьГруппуЭлементами();
	//}}
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

//{{Дополнение
&НаСервере
Процедура НаполнитьГруппуЭлементами()
	 
	//{{Поле согласованная скидка
	ПолеВвода = Элементы.Вставить("ДЗ_СогласованнаяСкидка", Тип("ПолеФормы"),Элементы.ГруппаСкидка);
	ПолеВвода.ПутьКДанным = "Объект.ДЗ_СогласованнаяСкидка";
	ПолеВвода.УстановитьДействие("ПриИзменении", "ВопросПользователю");
	ПолеВвода.Вид =ВидПоляФормы.ПолеВвода;
	ПолеВвода.Заголовок = "СогласованнаяСкидка";
	//Поле согласованная скидка}}
	
	//{{Кнопка пересчитать
	////Создаем кнопку пересчитать
	КнопкаПересчитать = Команды.Добавить("Пересчитать");
	КнопкаПересчитать.Заголовок = "Пересчитать";
	КнопкаПересчитать.Действие = "ПересчитатьСуммуТоварыИУслуги";
	////Создали кнопку пересчитать
	КнопкаКоманды = Элементы.Вставить("КнопкаПересчитать", Тип("КнопкаФормы"), Элементы.ГруппаСкидка);
	КнопкаКоманды.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	КнопкаКоманды.ИмяКоманды = "Пересчитать";
	КнопкаКоманды.Заголовок = "Пересчитать";
	//Кнопка пересчитать}}
	
	//{{Колонка с наименованием скидка для товаров и услуг
	КолонкаСкидкиТовары = Элементы.Вставить("СкидкаТовар", тип("ПолеФормы"), Элементы.Товары, Элементы.ТоварыСумма);
	КолонкаСкидкиТовары.ПутьКДанным = "Объект.Товары.Скидка";
	КолонкаСкидкиТовары.УстановитьДействие("ПриИзменении", "ПересчитатьСуммуТоварыИУслуги");
	КолонкаСкидкиТовары.Вид = ВидПоляФормы.ПолеВвода; 
		
	КолонкаСкидкиУслуги = Элементы.Вставить("СкидкаУслуга",тип("ПолеФормы"),Элементы.Услуги, Элементы.УслугиСумма);
	КолонкаСкидкиУслуги.ПутьКДанным = "Объект.Услуги.Скидка";
	КолонкаСкидкиУслуги.УстановитьДействие("ПриИзменении", "ПересчитатьСуммуТоварыИУслуги");
	КолонкаСкидкиУслуги.Вид = ВидПоляФормы.ПолеВвода; 
    //}}
		
КонецПроцедуры

&НаКлиенте
Асинх Процедура ВопросПользователю()
	
	// {{Проверить заполнение таблиц
	//  Если необходимо задать пользователю вопрос и пересчеть Товары и Услуги	
	Если ЗначениеЗаполнено(Объект.Товары) Или ЗначениеЗаполнено(Объект.Услуги) Тогда
		
		ОтветПользователя = Ждать ВопросАсинх("Пересчитать табличный документ?", РежимДиалогаВопрос.ДаНет, 15);
		
		Если ОтветПользователя = КодВозвратаДиалога.Да Тогда		
			ПересчитатьСуммуТоварыИУслуги();	
		Иначе		
			ОбщегоНазначенияКлиент.СообщитьПользователю("Пересчет отменен");
			Возврат;		
		КонецЕсли;
		
	КонецЕсли;	
	
КонецПроцедуры 

&НаКлиенте
Процедура ПересчитатьСуммуТоварыИУслуги()
	
	Если ЗначениеЗаполнено(Объект.Товары) Тогда	
		
		Для Каждого Товар Из Объект.Товары Цикл	
			РассчитатьСуммуСтроки(Товар);
		КонецЦикла; 
		
	КонецЕсли;
		
	Если ЗначениеЗаполнено(Объект.Услуги) Тогда
		
		Для Каждого Услуга Из Объект.Услуги Цикл	
			РассчитатьСуммуСтроки(Услуга);
		КонецЦикла;
		
	КонецЕсли;
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры
//}}

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
КоэффициентОбщаяСкидка =  1 - (ТекущиеДанные.Скидка + Объект.ДЗ_СогласованнаяСкидка) / 100;
		
	//{{ Сумма пересчитывается с учетом Объект.ДЗ_СогласованнаяСкидка
	Если (ТекущиеДанные.Скидка + Объект.ДЗ_СогласованнаяСкидка) <= 100 Тогда
	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентОбщаяСкидка;
Иначе
	ОбщегоНазначенияКлиент.СообщитьПользователю(СтрШаблон("Скидка на %1 превышает", ТекущиеДанные.Номенклатура));
КонецЕсли;	
	//}}

	РассчитатьСуммуДокумента();

КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
