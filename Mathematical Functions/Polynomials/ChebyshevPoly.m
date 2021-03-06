function T=ChebyshevPoly(tau,n,tauStart,tauEnd)
%%CHEBYSHEVPOLY  Evaluate Chebyshev polynomials of the first kind from
%                order 0 to n order at a given point tau. Note that when
%                one wishes to evaluate an n-th degree expansion in
%                Chebyshev polynomials, for example, for interpolation, it
%                is more computationally efficient to pass the cofficients
%                to the ChebyshevPolySynth function rather than using this
%                function to evaluate the Chebyshev polynomials,
%                multiplying the values by the coefficients and summing the
%                result. Use the function ChebyshevPoly1 if one only wishes
%                to evaluate a Chebyshev polynomial of a single given
%                order.
%
%INPUTS: tau     An NX1 or 1XN vector of values from tauStart to tauEnd, or
%                from -1 to 1 if tauStart and tauEnd are omitted, where one
%                wishes to evaluate the Chebyshev polynomials.
%        n       The non-negative integer maximum order of the Chebyshev
%                polynomials evaluated.
%tauStart,tauEnd The possible range of the inputs. If omitted, a  range of
%               -1 to 1 is assumed --the normal range for Chebyshev
%                polynomials. The option for mapping to a wider range is
%                useful when using Chebyshev polynomials for interpolation.
%                Note that the such polynomials are generally not useful
%                for interpolating much outside of the valid range.
%
%OUTPUTS: T      An (n+1)XN matrix of the Chebyshev polynomials from order
%                0 to n evaluated at each of the values of tau. T(i,j) is
%                the (i-1)th order Chebyshev polynomial evaluated at
%                tau(j).
%
%Chebyshev polynomials are often used to express orbital ephemerides and
%are described in
%X. X. Newhall, "Numerical representation of planetary ephemerides,"
%Celestial Mechanics, vol. 45, no. 1-3, pp. 305-310, 1989.
%and in Chapter 3.3.3 of
%O. Montenbruck and E. Gill, Satellite Orbits, 4th ed. Heidelberg:
%Springer, 2012.
%which is whence the recursion formula used here is taken.
%
%September 2014 David F. Crouse, Naval Research Laboratory, Washington D.C.
%(UNCLASSIFIED) DISTRIBUTION STATEMENT A. Approved for public release.

N=length(tau);

%Force tau to be a row vector.
tau=tau(:)';

%Map the tau values to the -1 to 1 range, if necessary.
if(nargin>2)
    tau=(tau-0.5*(tauStart+tauEnd))/(0.5*(tauEnd-tauStart));
end

T=zeros(n+1,N);

T(1,:)=1;
if(n>0)
    T(2,:)=tau;
end

if(n>1)
    for nCur=2:n
        T(nCur+1,:)=2*tau.*T(nCur,:)-T(nCur-1,:);
    end
end

end

%LICENSE:
%
%The source code is in the public domain and not licensed or under
%copyright. The information and software may be used freely by the public.
%As required by 17 U.S.C. 403, third parties producing copyrighted works
%consisting predominantly of the material produced by U.S. government
%agencies must provide notice with such work(s) identifying the U.S.
%Government material incorporated and stating that such material is not
%subject to copyright protection.
%
%Derived works shall not identify themselves in a manner that implies an
%endorsement by or an affiliation with the Naval Research Laboratory.
%
%RECIPIENT BEARS ALL RISK RELATING TO QUALITY AND PERFORMANCE OF THE
%SOFTWARE AND ANY RELATED MATERIALS, AND AGREES TO INDEMNIFY THE NAVAL
%RESEARCH LABORATORY FOR ALL THIRD-PARTY CLAIMS RESULTING FROM THE ACTIONS
%OF RECIPIENT IN THE USE OF THE SOFTWARE.
