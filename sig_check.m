function sig = sig_check(P)
if P > 0.05
    sig = 'n.s.';
elseif P <= 0.05 && P >0.01
    sig = '*';
elseif P <= 0.01 && P >0.001
    sig = '**';
elseif P <= 0.001
    sig = '***';
end % end if
end % end function