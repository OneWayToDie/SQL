--USE PV_521_DDL;
USE Prover04ka;

--CREATE TABLE FormsOfEducation	--ќчка, заочка, дистант
--(
--	form_id						INT				PRIMARY KEY IDENTITY(1,1),
--	form_name					NVARCHAR(100)	NOT NULL,
--	form_code					NVARCHAR(30)	NOT NULL,
--);

--CREATE TABLE PaymentTypes		--Ѕюджет, платка, целевуха
--(
--	payment_id					INT				PRIMARY KEY IDENTITY(1,1),
--	payment_type				NVARCHAR(50)	NOT NULL
--);

--CREATE TABLE DirectionsForms
--(
--	direction					TINYINT					NOT NULL,
--	form						INT						NOT NULL,
--	is_active					BIT,
--	PRIMARY KEY (direction, form),
--	CONSTRAINT					FK_DF_Directions		FOREIGN KEY (direction)		REFERENCES Directions(direction_id),
--	CONSTRAINT					FK_DF_FOE				FOREIGN KEY (form)			REFERENCES FormsOfEducation(form_id)
--);

--CREATE TABLE DirectionsPayment
--(
--	direction					TINYINT					NOT NULL,
--	payment						INT						NOT NULL,
--	is_active					BIT,
--	PRIMARY KEY (direction, payment),
--	CONSTRAINT					FK_DP_Directions		FOREIGN KEY (direction)		REFERENCES Directions(direction_id),
--	CONSTRAINT					FK_DP_PaymentTypes		FOREIGN KEY (payment)		REFERENCES PaymentTypes(payment_id)
--);

--DROP TABLE FormsOfEducation, PaymentTypes, DirectionsForms, DirectionsPayment;