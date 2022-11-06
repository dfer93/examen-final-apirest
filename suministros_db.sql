/*
 Navicat Premium Data Transfer

 Source Server         : PG12
 Source Server Type    : PostgreSQL
 Source Server Version : 120012
 Source Host           : localhost:5433
 Source Catalog        : suministros_db
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120012
 File Encoding         : 65001

 Date: 06/11/2022 11:40:58
*/


-- ----------------------------
-- Sequence structure for articulos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."articulos_id_seq";
CREATE SEQUENCE "public"."articulos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for categorias_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."categorias_id_seq";
CREATE SEQUENCE "public"."categorias_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for recepciones_detalle_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."recepciones_detalle_id_seq";
CREATE SEQUENCE "public"."recepciones_detalle_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for recepciones_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."recepciones_id_seq";
CREATE SEQUENCE "public"."recepciones_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for solicitudes_detalles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."solicitudes_detalles_id_seq";
CREATE SEQUENCE "public"."solicitudes_detalles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for solicitudes_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."solicitudes_id_seq";
CREATE SEQUENCE "public"."solicitudes_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for stock_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."stock_id_seq";
CREATE SEQUENCE "public"."stock_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for articulos
-- ----------------------------
DROP TABLE IF EXISTS "public"."articulos";
CREATE TABLE "public"."articulos" (
  "id" int8 NOT NULL DEFAULT nextval('articulos_id_seq'::regclass),
  "articulo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id_categoria" int8,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of articulos
-- ----------------------------
INSERT INTO "public"."articulos" VALUES (2, 'LAPIZ', 1, NULL, NULL);
INSERT INTO "public"."articulos" VALUES (3, 'CARTULINA', 1, NULL, NULL);
INSERT INTO "public"."articulos" VALUES (4, 'CUADERNO 100 HOJAS', 1, NULL, NULL);

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS "public"."categorias";
CREATE TABLE "public"."categorias" (
  "id" int8 NOT NULL DEFAULT nextval('categorias_id_seq'::regclass),
  "descripcion" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO "public"."categorias" VALUES (1, 'UTILES DE OFICINA', '2022-11-06 12:54:29', '2022-11-06 13:05:17');
INSERT INTO "public"."categorias" VALUES (2, 'TINTAS Y TONER', '2022-11-06 12:54:55', '2022-11-06 13:06:25');

-- ----------------------------
-- Table structure for recepciones
-- ----------------------------
DROP TABLE IF EXISTS "public"."recepciones";
CREATE TABLE "public"."recepciones" (
  "id" int8 NOT NULL DEFAULT nextval('recepciones_id_seq'::regclass),
  "proveedor" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "fecha" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of recepciones
-- ----------------------------

-- ----------------------------
-- Table structure for recepciones_detalles
-- ----------------------------
DROP TABLE IF EXISTS "public"."recepciones_detalles";
CREATE TABLE "public"."recepciones_detalles" (
  "id" int8 NOT NULL DEFAULT nextval('recepciones_detalle_id_seq'::regclass),
  "id_articulo" int8,
  "id_recepcion" int8,
  "cantidad" int4 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of recepciones_detalles
-- ----------------------------

-- ----------------------------
-- Table structure for solicitudes
-- ----------------------------
DROP TABLE IF EXISTS "public"."solicitudes";
CREATE TABLE "public"."solicitudes" (
  "id" int8 NOT NULL DEFAULT nextval('solicitudes_id_seq'::regclass),
  "dependencia" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "nro_solicitud" varchar(255) COLLATE "pg_catalog"."default",
  "fecha_solicitud" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "estado" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of solicitudes
-- ----------------------------

-- ----------------------------
-- Table structure for solicitudes_detalles
-- ----------------------------
DROP TABLE IF EXISTS "public"."solicitudes_detalles";
CREATE TABLE "public"."solicitudes_detalles" (
  "id" int8 NOT NULL DEFAULT nextval('solicitudes_detalles_id_seq'::regclass),
  "id_solicitud" int8,
  "id_articulo" int8,
  "cantidad_solicitada" int4 NOT NULL,
  "cantidad_aprobada" int4 NOT NULL,
  "observaciones" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of solicitudes_detalles
-- ----------------------------

-- ----------------------------
-- Table structure for stocks
-- ----------------------------
DROP TABLE IF EXISTS "public"."stocks";
CREATE TABLE "public"."stocks" (
  "id" int8 NOT NULL DEFAULT nextval('stock_id_seq'::regclass),
  "id_articulo" int4 NOT NULL,
  "disponibilidad" int4 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of stocks
-- ----------------------------

-- ----------------------------
-- Function structure for tf_disminuye_stock
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."tf_disminuye_stock"();
CREATE OR REPLACE FUNCTION "public"."tf_disminuye_stock"()
  RETURNS "pg_catalog"."trigger" AS $BODY$DECLARE

BEGIN 
		
			UPDATE stocks 
			SET disponibilidad = (disponibilidad - new.cantidad_aprobada)
			WHERE id_articulo = new.id_articulo;

	RETURN NEW;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for tf_solicitud_numero
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."tf_solicitud_numero"();
CREATE OR REPLACE FUNCTION "public"."tf_solicitud_numero"()
  RETURNS "pg_catalog"."trigger" AS $BODY$DECLARE
_cantidad integer;
BEGIN 
		SELECT count(id) INTO _cantidad FROM solicitudes WHERE estado = 'G' and extract('year' from fecha_solicitud::date) = extract('year' from CURRENT_DATE);
		
		UPDATE solicitudes 
		SET nro_solicitud = concat(_cantidad, '/', extract('year' from CURRENT_DATE))
		WHERE id = new.id;

	RETURN NEW;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for tf_stock_aumento
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."tf_stock_aumento"();
CREATE OR REPLACE FUNCTION "public"."tf_stock_aumento"()
  RETURNS "pg_catalog"."trigger" AS $BODY$DECLARE
_id integer;
_existe_stock integer;
BEGIN 
		
		
		--=====================================
		-- COMPROBACION DE NUMEROS MAYORES A 0
		--=====================================
		IF new.cantidad < 1 THEN
			RAISE EXCEPTION 'CANTIDAD INVALIDA';
			RETURN OLD;
		END IF;


		IF TG_OP = 'INSERT' THEN
					--COMPRUEBA SI EXISTE ARTICULO EN LA TABLA stocks, EN CASO DE NO INSERTA, EN CASO AFIRMATIVO ACTUALIZA SU CANTIDAD
					SELECT count(stocks.id) INTO _existe_stock FROM stocks where id_articulo = new.id;
					
					IF _existe_stock = 0 THEN 
						INSERT INTO stocks(id_articulo, disponibilidad)
						VALUES (new.id_articulo, new.cantidad)
						RETURNING id INTO _id;
						RAISE NOTICE 'SE INSERTO EL ID % ', _id;
					ELSE 
						UPDATE stocks
						SET    disponibilidad = disponibilidad + new.cantidad
						WHERE  id_articulo = new.id;

					END IF;

		ELSIF TG_OP = 'UPDATE' THEN

			UPDATE stocks 
			SET disponibilidad = (disponibilidad - old.cantidad) + new.cantidad
			WHERE id_articulo = new.id_articulo;

		END IF;


	RETURN NEW;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."articulos_id_seq"
OWNED BY "public"."articulos"."id";
SELECT setval('"public"."articulos_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."categorias_id_seq"
OWNED BY "public"."categorias"."id";
SELECT setval('"public"."categorias_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."recepciones_detalle_id_seq"
OWNED BY "public"."recepciones_detalles"."id";
SELECT setval('"public"."recepciones_detalle_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."recepciones_id_seq"
OWNED BY "public"."recepciones"."id";
SELECT setval('"public"."recepciones_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."solicitudes_detalles_id_seq"
OWNED BY "public"."solicitudes_detalles"."id";
SELECT setval('"public"."solicitudes_detalles_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."solicitudes_id_seq"
OWNED BY "public"."solicitudes"."id";
SELECT setval('"public"."solicitudes_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."stock_id_seq"
OWNED BY "public"."stocks"."id";
SELECT setval('"public"."stock_id_seq"', 2, true);

-- ----------------------------
-- Primary Key structure for table articulos
-- ----------------------------
ALTER TABLE "public"."articulos" ADD CONSTRAINT "articulos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table categorias
-- ----------------------------
ALTER TABLE "public"."categorias" ADD CONSTRAINT "categorias_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table recepciones
-- ----------------------------
ALTER TABLE "public"."recepciones" ADD CONSTRAINT "recepciones_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table recepciones_detalles
-- ----------------------------
CREATE TRIGGER "t_aumenta_stock" AFTER INSERT OR UPDATE OF "cantidad" ON "public"."recepciones_detalles"
FOR EACH ROW
EXECUTE PROCEDURE "public"."tf_stock_aumento"();

-- ----------------------------
-- Primary Key structure for table recepciones_detalles
-- ----------------------------
ALTER TABLE "public"."recepciones_detalles" ADD CONSTRAINT "recepciones_detalle_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table solicitudes
-- ----------------------------
CREATE TRIGGER "t_solicitud_nro" AFTER INSERT ON "public"."solicitudes"
FOR EACH ROW
EXECUTE PROCEDURE "public"."tf_solicitud_numero"();

-- ----------------------------
-- Primary Key structure for table solicitudes
-- ----------------------------
ALTER TABLE "public"."solicitudes" ADD CONSTRAINT "solicitudes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table solicitudes_detalles
-- ----------------------------
CREATE TRIGGER "t_disminuye_Stock" AFTER UPDATE OF "cantidad_aprobada" ON "public"."solicitudes_detalles"
FOR EACH ROW
EXECUTE PROCEDURE "public"."tf_disminuye_stock"();

-- ----------------------------
-- Primary Key structure for table solicitudes_detalles
-- ----------------------------
ALTER TABLE "public"."solicitudes_detalles" ADD CONSTRAINT "solicitudes_detalles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table stocks
-- ----------------------------
ALTER TABLE "public"."stocks" ADD CONSTRAINT "stock_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table articulos
-- ----------------------------
ALTER TABLE "public"."articulos" ADD CONSTRAINT "articulos_id_categoria_foreign" FOREIGN KEY ("id_categoria") REFERENCES "public"."categorias" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table recepciones_detalles
-- ----------------------------
ALTER TABLE "public"."recepciones_detalles" ADD CONSTRAINT "recepciones_detalle_id_articulo_foreign" FOREIGN KEY ("id_articulo") REFERENCES "public"."articulos" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."recepciones_detalles" ADD CONSTRAINT "recepciones_detalle_id_recepcion_foreign" FOREIGN KEY ("id_recepcion") REFERENCES "public"."recepciones" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table solicitudes_detalles
-- ----------------------------
ALTER TABLE "public"."solicitudes_detalles" ADD CONSTRAINT "solicitudes_detalles_id_articulo_foreign" FOREIGN KEY ("id_articulo") REFERENCES "public"."articulos" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."solicitudes_detalles" ADD CONSTRAINT "solicitudes_detalles_id_solicitud_foreign" FOREIGN KEY ("id_solicitud") REFERENCES "public"."solicitudes" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
