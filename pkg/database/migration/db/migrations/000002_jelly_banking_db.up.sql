BEGIN;

INSERT INTO "roles" (
    "title"
)
VALUES
    ('customer'),
    ('admin');

INSERT INTO
    "users" (
        "fname" ,
        "lname" ,
        "account_no",
        "moblie_no" ,
        "email" ,
        "password",
        "role_id",
        "balance"     
    )
VALUES
    (
        'jelly',
        'tod',
        '00001',
        '0803354568',
        'jelly@tod.com',
        '$2a$10$8KzaNdKIMyOkASCH4QvSKuEMIY7Jc3vcHDuSJvXLii1rvBNgz60a6' ,
        1,
        2000
        
    ),
    (
        'Dew',
        'Do',
        '00002',
        '09645684523',
        'dew@tdo.com',
        '$2a$10$3qqNPE.TJpNGYCohjTgw9.v1z0ckovx95AmiEtUXcixGAgfW7.wCi',
        2,
        1000
         
    );



INSERT INTO
    "transaction" (
        "order_type",
        "old_balance",
        "new_balance",
        "amount",
        "account_no"
    )
VALUES
    (
        'deposit',
        1500.00,
        2000.00,
        500.00,
        '00001'
    ),
    (
        'withdraw',
        1500.00,
        1000.00,
        500.00,
        '00002'
    );




COMMIT;