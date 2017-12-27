
function [Encoded_message, a] = convolutionPhuc[message]
Encoder_Memory = [0 0 0];
Encoded_message = zeros[length[message]*2];
N = length[message];
n = N;
p = 1;
for i = 1 : N
	Encoder_Memory[1, 3] = Encoder_Memory[1, 2];
	Encoder_Memory[1, 2] = Encoder_Memory[1, 1];
    if[i <= N]
        Encoder_Memory[1,1] = message[n];
    else
        Encoder_Memory[1,1] = 0;
    end
	A0 = xor[Encoder_Memory[1,1], Encoder_Memory[1, 3]];
	A1 =  xor[A0, Encoder_Memory[1, 2]];
	Encoded_message[1, p] = A1;
	Encoded_message[1, p + 1] = A0;
    n = n - 1;
    p = p + 2;
    
    a[1,1]= Encoded_message[1,end]
    L = numel[a]
    
end
 



   
    