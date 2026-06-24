select * from cinema 
where id %2 =1 and description !="boring"
order by rating desc; 

-- we are use % to find it is even or odd and description ! =" boring "
--  ! is comparietion operateding and is boring is true it will hidened and flase it will show 