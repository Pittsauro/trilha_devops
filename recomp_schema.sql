declare

v_schema varchar2(100) := &1;

begin

exec utl_recomp.recomp_serial(v_schema);

end;
/
