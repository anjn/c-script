$cc="g++";
$gdb="gdb";
$ddd="ddd";

$default_header="#include <c-script.h>\n";

$output_opt="-o ";

$normal_opt=qq(
-O4
-DNDEBUG
-mfpmath=sse
-mmmx
-msse
-msse2
-msse3
-m3dnow
-march=native
-ftree-vectorize
--no-warn
);

$normal_opt=qq(
-O4
-DNDEBUG
-march=native
--no-warn
);

$normal_opt=qq(
-O4
-Wall
-std=c++0x
-fopenmp
);
    
$debug_opt =qq(
-g
-std=c++0x
);

$opt=qq(
-I$script_home
-I$script_home/include
-L$script_home
-I.
-L.
);
#-I$script_home/include/matrix

$libs=qq(
-ljpeg
-lpng
-lz
-lm
);
#-llapack
#-latlas
#-lblas
#-lgfortran

%autolibs=(
    math.h => '-lm' ,
    );

%autoheaders=(
    printf => '#include <cstdio>' ,
    );


#$libs.= getlib("/usr/lib/libboost_regex*.a");
if($vc){
    $cc="cl";
    $output_opt="/Fe";
    $normal_opt=qq(/Ox);
    $debug_opt ="/ZI";
    $opt=qq(/I$script_home /I$script_home/include /I.     );
    $libs=qq(/MT /link /libpath:. /libpath:$script_home    );
}

