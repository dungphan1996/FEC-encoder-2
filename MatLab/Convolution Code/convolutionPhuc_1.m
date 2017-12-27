function [Result] = convolutionPhuc(message)
message = [1 1 0 0 1];
Encoder_Memory = [0 0 0];
Encoded_message = zeros(1,(length(message))*2);
Result = zeros(1,(length(message))*2);
N = length(message);
n = N;
L = 2*n;
p = 1; 
o = 1;
for i=1 : N
	Encoder_Memory(1, 3) = Encoder_Memory(1, 2);
	Encoder_Memory(1, 2) = Encoder_Memory(1, 1);
    if(i <= N)
        Encoder_Memory(1,1) = message(n);
    else
        Encoder_Memory(1,1) = 0;
    end
	A0 = xor(Encoder_Memory(1,1), Encoder_Memory(1, 3));
	A1 =  xor(A0, Encoder_Memory(1, 2));
	Encoded_message(1, p) = A1;
	Encoded_message(1, p + 1) = A0;
    n = n - 1;
    p = p + 2;
end
for i = 1: N
	Result(1, o) = Encoded_message(1,L-1);
	Result(1, o+1) = Encoded_message(1,L);
	L = L -2;
	o = o + 2;
end
end
	