function P=ph(signal)
s=signal;
n=length(s);
m=1;
ph=[];
 for i=2:n-1
        if s(i-1)+eps<s(i) && s(i)>s(i+1)+eps  
           L(m)=i;
           m=m+1;
        end
 end
 m=1;
 ii2=1;
while(ii2<=n)
        while(ii2<=L(1))  
           ph(ii2)=2*pi*(ii2/(L(1)));
           ii2=ii2+1;
        end
        if m<length(L)
            m=m+1;
            while(ii2<=L(m))
            ph(ii2)=2*pi*(m-1)+2*pi*((ii2-L(m-1))/(L(m)-L(m-1)));
            ii2=ii2+1;
            end
        else
            while(ii2<=n)
            ph(ii2)=2*pi*(m)+2*pi*(ii2/n);
            ii2=ii2+1;
            end
        end
end
 P=ph;