
## plot-vector
## Big hack to make it easy to represent
## vectors as plottable lines

1;

function out = num_to_point2d(n)
  out = strcat("[0, ", num2str(n), "]");
endfunction

function out = vector3d_to_point3d(v)
  out = strcat(num_to_point2d(v(1)), ",", num_to_point2d(v(2)), ",", num_to_point2d(v(3)));
endfunction

function out = strjoin(strings)
  first = true;
  res = "";
  for cell = strings
    str = cell{1};
    if(first)
      res = str;
      first = false;
    else
      res = strcat(res, ",", str);
    endif
  endfor

  out = res;
endfunction

# plot_vectors([x, y, z], ...)
function plot_vectors(varargin)
  args = cellfun(@vector3d_to_point3d, varargin, "UniformOutput", false);
  eval(["plot3(" strjoin(args)  ")"]);
endfunction



## vector operations
## (that I couldn't find in the standard
## lib, but I'm not very familiara with
## matrix terminology)

function out = vector_length(v)
  out = sqrt(dot(v, v));
endfunction

function out = unit(v)
  out = v * 1/vector_length(v);
endfunction
