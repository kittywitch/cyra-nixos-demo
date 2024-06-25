{ ... }: {
   home-manager = {
     useUserPackages = true;
     useGlobalPkgs = true;
     users.kat = {
       imports = [
         ../home
       ];
     };
   };
}
