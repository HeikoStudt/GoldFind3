var
  vArticle : tArticle;
  PgrI     : integer;
  ok       : Boolean;

      function BuildTree( Ref : String; vorh, nach : tStringList) : PVirtualNode;
          function GetParentArtNum(ref : string; vorh, nach : tStringList; out vorher : Boolean) : Integer;

                function GetLastMID(var Ref : String) : String;
                var
                  i : integer;
                begin
                  //Splitted von Ref die letzte (nicht erste!) MID und gibt sie zurück
                  Ref := Trim(Ref);
                  i := LastDelimiter('<',Ref);
                  Result := copy(Ref,i,length(Ref));
                  Ref := copy(Ref,1,i-1);
                  if (pos('<',ref)=0) or (pos('>',ref)=0) then
                    Ref := '';
                end;

          var Num : Integer;
              temMid : String;
          begin
            Num := -1;
            vorher := false;
            while (Num=-1) and (ref<>'') do begin //Solange es noch MIDs gibt und er keinen Root gefunden hat...
              temMID := GetLastMID(ref);     //Letzte MID lesen
              Vorher := true;                //MID in der non-sichtbaren Liste
              Num := vorh.indexof(temMID);   //Wo in der Liste liegt die MID?
              if (Num=-1) then begin         //Oder überhaupt?
                Vorher := false;             //Wenn nicht, dann ist die MID schon existent
                Num := nach.indexof(temMID); //Wo dort?
              end
            end;
            Result := Num;
          end;

      var  //BuildTree
        Num : Integer;
        Vorher : Boolean;

        temData : pOverview;
        temNode : pVirtualNode;
        temTreeData : pOverview;

      begin
        Num := GetParentArtNum(ref, vorh, nach, vorher);

        if Num=-1 then begin              //Gar nicht aufgetaucht  --> Child of Root
              Result := res.AddChild(nil)
        end else if Vorher then begin     //In "Vorher" aufgetaucht  --> Rekursion um die References auszuwerten.
              temTreeData := pOverview(vorh.objects[Num]);
              vorh.delete(num);

              if (PgrI mod 100) = 0 then
                if not PgFrm.Progress('', PgrI) then
                  ok := false;
              inc(PgrI);

              temNode := BuildTree(temTreeData^.References,  //Rekursion
                                   Vorh, Nach);
              temData := res.GetNodeData(temNode);

              temTreeData^.References := '';

              with temData^ do begin //Save Headers (Overview)
                ArtNum     := temTreeData^.ArtNum;
                Mid        := temTreeData^.Mid;
                Date       := temTreeData^.Date;
                References  := '';
      //          Size       := temTreeData^.Size;
                Path       := temTreeData^.Path;
                DBTyp      := temTreeData^.DBTyp;

                From    := temTreeData^.From;
                Subject := temTreeData^.Subject
              end;

              Nach.AddObject(temTreeData^.Mid, TObject(temNode));
              Dispose(TemTreeData);

              Result := res.AddChild(temNode);

        end else begin //In Nachher aufgetaucht --> AddChild
              Result := res.AddChild(PVirtualNode(nach.objects[Num]));
        end;
      end;


var
  TreeBuildVorher  : tStringList; //Liste der zu durchsuchenden.
  TreeBuildNachher : tStringList; //Zu durchsuchen (NODEs!)
  i : integer;
  temData : pOverview;
  temTreeData : pOverview;
  temNode : pVirtualNode;
  frm, Sbj : string;

begin
{  if not (Min > ArtList[0]) and
     not (Max < ArtList[length(ArtList)]) then}
  //ToDo: Überprüfen warum nicht
  begin
    PgFrm.Min := 0;
    PgFrm.Max := 0;
    PgFrm.Max := length(ArtList);
    PgFrm.Min := 0;

    TreeBuildVorher  := tStringList.create;
    TreeBuildNachher := tStringList.create;
    vArticle := tArticle.create;
    try
      TreeBuildVorher.sorted := true;
      TreeBuildNachher.sorted := true;
      //Create list of articles
      for i := 0 to length(ArtList) do begin
        if (i mod 100) = 0 then
          if not PgFrm.Progress('',i) then
            break;

        vArticle.FullHeader := Header(ArtList[i]);
        if not (vArticle.FullHeader='') then begin

          new(temTreeData);

          with temTreeData^ do begin
            //Save Headers (Overview)
            ArtNum     := ArtList[i];
            Mid        := vArticle.Header['Message-ID:'];
            References := vArticle.Header['References:'] + vArticle.Header['In-Reply-To:'];
                                  //References + In-Reply-To  um den Tree zu finden.
                                  //In-Reply-To wird so als erstes ausgewertet!
            Date       := vArticle.GetGMTDateDT;
//            Size       := Length(vArticle.Text);
            Path       := vPath;
            DBTyp      := fDBTyp;

            frm  := vArticle.Header['From:'];
            Sbj  := vArticle.Header['Subject:'];

            //Decode Headers
            From    := DecodeHeadervalue( Frm[1], length(Frm) );
            Subject := DecodeHeadervalue( Sbj[1], length(Sbj) );

            //In Liste einfügen
            TreeBuildVorher.addobject(Mid, TObject(temTreeData));
          end;
        end;
      end;


      //Build Tree into VirtualTree
      PgrI := 0;
      ok := true;
      while (TreeBuildVorher.Count-1>=0) and ok do begin
        if (PgrI mod 100) = 0 then
          if not PgFrm.Progress('', PGrI) then
            ok := false;
        inc(PgrI);

        temTreeData := pOverview(TreeBuildVorher.objects[0]);
        TreeBuildVorher.delete(0);

        temNode := BuildTree(temTreeData^.References,
                   TreeBuildVorher, TreeBuildNachher);

        temData := res.GetNodeData(temNode);

        temTreeData^.References := '';

        with temData^ do begin //Save Headers (Overview)
          ArtNum     := temTreeData^.ArtNum;
          Mid        := temTreeData^.Mid;
          References := '';
          Date       := temTreeData^.Date;
//          Size       := temTreeData^.Size;
          Path       := temTreeData^.Path;
          DBTyp      := temTreeData^.DBTyp;

          From    := temTreeData^.From;
          Subject := temTreeData^.Subject
        end;

        TreeBuildNachher.AddObject(temTreeData^.Mid, TObject(temNode));
        Dispose(TemTreeData);
      end;


      //Speicherplatz wieder freigeben...
      while TreeBuildVorher.count-1>=0 do begin
        dispose(pOverview(TreeBuildVorher.Objects[0]));
        TreeBuildVorher.delete(0);
      end;
    finally
      vArticle.free;
      TreeBuildVorher.free;
      TreeBuildNachher.free;
    end;
  end;
