
MERGE INTO MASTER.CUSTOMERS_BASE AS tgt
USING MASTER.CUSTOMERS_STG     AS src
   ON tgt.CUSTOMER_ID = src.CUSTOMER_ID

-- ── MATCH: record exists → update all columns ──────────────────────────
WHEN MATCHED
THEN UPDATE SET
    tgt.FIRST_NAME        = src.FIRST_NAME,
    tgt.LAST_NAME         = src.LAST_NAME,
    tgt.GENDER            = src.GENDER,
    tgt.DATE_OF_BIRTH     = src.DATE_OF_BIRTH,
    tgt.EMAIL             = src.EMAIL,
    tgt.PHONE             = src.PHONE,
    tgt.CITY              = src.CITY,
    tgt.STATE             = src.STATE,
    tgt.COUNTRY           = src.COUNTRY,
    tgt.PINCODE           = src.PINCODE,
    tgt.CUSTOMER_SEGMENT  = src.CUSTOMER_SEGMENT,
    tgt.REGISTERED_DATE   = src.REGISTERED_DATE,
    tgt.IS_ACTIVE         = src.IS_ACTIVE

-- ── NEW record → insert ─────────────────────────────────────────────────
WHEN NOT MATCHED THEN INSERT (
    CUSTOMER_ID
	, FIRST_NAME
	, LAST_NAME
	, GENDER
	, DATE_OF_BIRTH
	, EMAIL
	, PHONE
	, CITY
	, STATE
	, COUNTRY
	, PINCODE
	, CUSTOMER_SEGMENT
	, REGISTERED_DATE
	, IS_ACTIVE) 
VALUES (
    src.CUSTOMER_ID
	, src.FIRST_NAME
	, src.LAST_NAME
	, src.GENDER
	, src.DATE_OF_BIRTH
	, src.EMAIL
	, src.PHONE
	, src.CITY
	, src.STATE
	, src.COUNTRY
	, src.PINCODE
	, src.CUSTOMER_SEGMENT
	, src.REGISTERED_DATE
	, src.IS_ACTIVE
);