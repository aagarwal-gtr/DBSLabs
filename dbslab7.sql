DECLARE 
        input number;
        iterator number:=6;
BEGIN

  while iterator > 0 loop
  input:=&input;
  IF input<25 then
     if (input=5) then
            insert into temp(Num_store, Char_store) values (input, 'FIVE');
    else if (input=10) then
            insert into temp(Num_store, Char_store) values (input, 'TEN');
            
    else if (input=15) then
            insert into temp(Num_store, Char_store,Date_store) values (input, 'FIFTEEN',sydate);
            
     else if (input=20) then
            insert into temp(Num_store, Char_store,Date_store) values (input, 'TWENTY',sydate);
        
    else
      insert into temp(Num_store) values (input);
   
  end if;
  end if;
  iterator:=iterator-1;
  end loop;      
END;