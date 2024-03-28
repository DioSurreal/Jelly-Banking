BEGIN;

INSERT INTO
    "users" (
        "fname" ,
        "lname" ,
        "account_no",
        "moblie_no" ,
        "email" ,
        "address" ,
        "balance" 
    )
VALUES
    (
        'jelly',
        'tod',
        '00001',
        '0803354568',
        'jelly@tod.com',
        'kdkk ldfkdfdf; dsfkodfo sdffd',
        2000
    ),
    (
        'Dew',
        'Do',
        '00002',
        '09645684523',
        'dew@tdo.com',
        ';;fkdo dofkdf kddko dfdf',
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