CREATE TABLE сотрудники
(
  код_сотрудника INT NOT NULL,
  ФИО INT NOT NULL,
  Возвраст INT NOT NULL,
  пол INT NOT NULL,
  адрес INT NOT NULL,
  телефон INT NOT NULL,
  паспортные_данные INT NOT NULL,
  PRIMARY KEY (код_сотрудника)
);

CREATE TABLE должности
(
  код_должности INT NOT NULL,
  наименование_должности INT NOT NULL,
  оклад INT NOT NULL,
  обязанности INT NOT NULL,
  требования INT NOT NULL,
  код_сотрудника INT NOT NULL,
  PRIMARY KEY (код_должности),
  FOREIGN KEY (код_сотрудника) REFERENCES сотрудники(код_сотрудника)
);

CREATE TABLE марки
(
  код_марки INT NOT NULL,
  наименованние INT NOT NULL,
  технические_характеристики INT NOT NULL,
  стоимость INT NOT NULL,
  специфика INT NOT NULL,
  PRIMARY KEY (код_марки)
);

CREATE TABLE автомобили
(
  код_автомобиля INT NOT NULL,
  регистрационный_номер INT NOT NULL,
  номер_кузова INT NOT NULL,
  номер_двигателя INT NOT NULL,
  год_выпуска INT NOT NULL,
  пробег INT NOT NULL,
  дата_последнего_ТО INT NOT NULL,
  специальные_отметки INT NOT NULL,
  код_марки INT NOT NULL,
  код_сотрудника INT NOT NULL,
  код_сотрудника_шофёракод_сотрудника INT NOT NULL,
  PRIMARY KEY (код_автомобиля),
  FOREIGN KEY (код_марки) REFERENCES марки(код_марки),
  FOREIGN KEY (код_сотрудника) REFERENCES сотрудники(код_сотрудника),
  FOREIGN KEY (код_сотрудника_шофёракод_сотрудника) REFERENCES сотрудники(код_сотрудника)
);

CREATE TABLE вызовы
(
  дата INT NOT NULL,
  время INT NOT NULL,
  телефон INT NOT NULL,
  откуда INT NOT NULL,
  куда INT NOT NULL,
  код_вызова INT NOT NULL,
  код_автомобиля INT NOT NULL,
  код_сотрудника INT NOT NULL,
  PRIMARY KEY (код_вызова),
  FOREIGN KEY (код_автомобиля) REFERENCES автомобили(код_автомобиля),
  FOREIGN KEY (код_сотрудника) REFERENCES сотрудники(код_сотрудника)
);

CREATE TABLE тарифы
(
  код_тарифа INT NOT NULL,
  наименнование INT NOT NULL,
  описание INT NOT NULL,
  стоимость INT NOT NULL,
  код_вызова INT NOT NULL,
  PRIMARY KEY (код_тарифа),
  FOREIGN KEY (код_вызова) REFERENCES вызовы(код_вызова)
);

CREATE TABLE доп_услуги
(
  код_услуги INT NOT NULL,
  наименованние INT NOT NULL,
  описание_услуги INT NOT NULL,
  стоимость INT NOT NULL,
  код_вызова INT NOT NULL,
  PRIMARY KEY (код_услуги),
  FOREIGN KEY (код_вызова) REFERENCES вызовы(код_вызова)
);