function xq = twosquant(x,w,rmode,omode)
% 2's complement quantizer for the range of [-1,1)
% with selectable modes for rounding and overflow
% 
% ### This function requires the Fixed-Point Toolbox !!! ### 
%
% 2's complement quantizer for fixed-point numbers in the range [-1,+1)
% with 2 selectable round modes and 2 selectable modes for overflow 
% x 	: input sequence
% w 	: wordlength 
% rmode : roundmode 
%  - 'r' for round (rounds to the closest representable number)
%  - 't' for truncation (rounds toward floor)
% omode : overflow mode
%  - 's' for saturation (clipping)
%  - 'o' for 2's complement overflow (wrap)
%
if nargin ~= 4
    error('Usage: xq = twosquant(x, w, rmode, omode)');
end
if w <= 0
    error('Wordlength must be a positive integer');
end
%
% Structure struct with fields mode, format, roundmode, overflowmode
%
% mode
struct.mode = 'fixed'; 
% format
struct.format = [w w-1];
% roundmode
if strcmp(rmode, 'r')              
   struct.roundmode = 'round';      
elseif strcmp(rmode, 't')          
  struct.roundmode = 'floor';       
else
    error('Unknown reduction mode');
end
% overflowmode
if strcmp(omode, 's')
    struct.overflowmode = 'saturate'; 
elseif strcmp(omode, 'o')   
   struct.overflowmode = 'wrap';
else
    error('Unknown overflow mode');
end
%
% Create a quantizer object and call the quantize method
%
q = quantizer(struct); 
xq = quantize(q,x);
% EOF