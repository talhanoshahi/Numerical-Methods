% function to check if a matrix data passed in is equispaced
% equispaced means that the diffrence between every two members must be the same

function return_value = is_equispaced (to_check , mat_len)
  check_difference = 0.0;

  if mat_len <= 1
    return_value = false;

    return;
  end
  
  if mat_len > 1
    check_difference = to_check(2) - to_check(1);
  end

  for i = 3:mat_len
    check_curr_difference = to_check(i) - to_check(i-1);
    
    if check_curr_difference ~= check_difference
      return_value = false;
      return;
    end

  end

  return_value = true;
    
end
