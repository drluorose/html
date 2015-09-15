
ALTER TABLE tb_trans_withdraw_ask CHANGE   `account` `amount` decimal(15,2) DEFAULT NULL COMMENT '提现金额';
alter TABLE tb_trans_withdraw_ask change `bank_amount` `bank_holder_name` varchar(32) DEFAULT NULL comment '银行持卡人姓名';

UPDATE tb_trans_account set total_crash = 0.0 where total_crash is null;
UPDATE tb_trans_account set balance = 0.0 where balance is null;

UPDATE tb_trans_account set cash_amount = 0.0 where freeze_cash_amount is null;

UPDATE tb_trans_account set freeze_cash_amount = 0.0 where freeze_cash_amount is null;

UPDATE tb_trans_account set freeze_uncash_amount = 0.0 where freeze_uncash_amount is null;
update tb_trans_account set uncash_amount  = 0.0  where uncash_amount is null;
-- 2015-07-30 --


delete from tb_trans_account where  customer_id in
  (select customer_id from (select  customer_id  from tb_trans_account  group  by  customer_id   having  count(customer_id) > 1) a )
  and _rowid not in (select a.rid from (select min(_rowid) as rid from  tb_trans_account  group by customer_id  having count(customer_id )>1)  a)


ALTER TABLE tb_trans_account ADD UNIQUE idx_customer_id (customer_id);