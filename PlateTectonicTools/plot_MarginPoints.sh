gmt set FONT_ANNOT_PRIMARY 6p,Helvetica,black FONT_LABEL 7p,Helvetica,black FONT_TITLE 12p,Helvetica,black MAP_FRAME_TYPE fancy MAP_TICK_LENGTH 0.0c MAP_ANNOT_OFFSET 0.05c MAP_LABEL_OFFSET 0.15c MAP_TITLE_OFFSET 0.0c MAP_GRID_PEN_PRIMARY 0.1p,grey,- MAP_FRAME_PEN thin

# Mollweide projection
# Projection
#frame=90/150/0/89
#width=15
#proj=M0/$width

frame=g
width=15
proj=N0/$width


#gmt makecpt -Crainbow -T80/210/5 > Slope.cpt
ay_root=/Users/ajy321/PhD_work/SeaLevel/SeaLevel_MS/GPlatesFiles
color=margin_age.cpt


# ---- Set recontime loop

age=100

  while (( $age <= 155 ))
      do

pspref=BasinPoints_MarginAge_${age}
psfile=${pspref}.ps

infile=PassiveMargin_dataframe_${age}Ma.csv
sz_infile=SubMargin_dataframe_${age}Ma.csv

subduction_left=${ay_root}/TopologiesExport/topology_subduction_boundaries_sL_${age}.00Ma.xy
subduction_right=${ay_root}/TopologiesExport/topology_subduction_boundaries_sR_${age}.00Ma.xy
csfilexy=/Users/ajy321/PhD_work/SeaLevel/SeaLevel_MS/GPlatesFiles/Coastlines/reconstructed_${age}.00Ma.xy


#gmt psxy SW_agegrid.dat -W1.75p,BLACK -Sc0.1p -Gred $SCALE $FRAME -Rg -JW0/10c -V -K > $psfile
#gmt psxy SZ_300kmStencilMask_0Ma_contour.txt -W1p,ORANGE -Gorange $SCALE $FRAME -R0/360/-80/80 -JM0/20c -V -K -Y5 > $psfile
gmt psxy $csfilexy -R${frame} -J$proj -GANTIQUEWHITE -V -K > $psfile

awk -F "\"*,\"*" '{print ($3, $2, $5) } ' ${infile} | gmt psxy -W0.25p,BLACK -Sc2.p -C${color} -R$frame -J$proj -V -K -O >> $psfile

#gmt psxy EarthByte_COB_0Ma_contour.txt -W1p,GREY $SCALE $FRAME -R0/360/-80/80 -JM0/20c -V -K -O -Bag >> $psfile

gmt psxy -R${frame} -J$proj -W1.p,WHITE -Sf4p/1.0plt -K -O $subduction_left -V >> $psfile
gmt psxy -R${frame} -J$proj -W1.p,WHITE -Sf4p/1.0prt -K -O $subduction_right -V >> $psfile

gmt psxy -R${frame} -J$proj -W.5p,GREY -Sf4p/1.0plt -K -O $subduction_left -V >> $psfile
gmt psxy -R${frame} -J$proj -W.5p,GREY -Sf4p/1.0prt -K -O $subduction_right -V >> $psfile
awk -F "\"*,\"*" '{print ($3, $2, $5) } ' ${sz_infile} | gmt psxy -W0.25p,BLACK -Sc]2.p -C${color} -R$frame -J$proj -V -K -O >> $psfile

gmt psbasemap -R${frame} -J$proj -Ba30f30g30:."":Wsne -O -K -V >> $psfile

gmt set FONT_ANNOT_PRIMARY 10p,Helvetica,black FONT_LABEL 10p,Helvetica,black FONT_TITLE 12p,Helvetica,black MAP_FRAME_TYPE fancy MAP_TICK_LENGTH 0.0c MAP_ANNOT_OFFSET 0.05c MAP_LABEL_OFFSET 0.15c MAP_TITLE_OFFSET 0.0c MAP_GRID_PEN_PRIMARY 0.1p,black,. MAP_FRAME_PEN thin


#psscale -C${color} -Ba5f5:"Length/Coastal gradient": -D7.5c/0c/15c/0.5ch -V -O -N -Y-0.5 >> $psfile
psscale -C${color} -Ba20f10g10:"Age [Ma]": -D7.5c/0c/15c/0.5ch -V -O -N -Y-0.5 >> $psfile

#echo "0.5 4.5 18 0 0 5 $age Ma" | pstext -R0/$width/0/1 -Jx1 -Y-3.5 -N -O >> $psfile


# Converts the sglobal Mollweide projection PS file to a 150 dpi JPEG file
ps2raster $psfile -A -E700 -Tj -P

#-----------Clean up and remove unnecessary files

age=$(($age + 5))
done

#rm *.ps