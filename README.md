# SeaLevel
## Collection of Jupyter notebooks used to calculate long-term sea level change using plate tectonic reconstructions and time-dependent geodynamic models of past mantle flow ##

The Python Jupyter Notebooks in this repository accompany the article Long-term Phanerozoic sea level change from solid Earth processes by Young et al., 

The notebooks require GMT and Python 2.7 or above. They are numbered sequentially from 1-8 and need be run in order.

Notebook 1 takes synthetic sea floor age maps and converts them to depth using the Richards et al. (2018) lithospheric cooling models. This notebook also calculates the volume above subduction zones from geodynamic models.

Notebook 2 uses geostatistical modelling to estimate sediment thickness through time. 

Notebook 3 uses the method of Schubert and Sandwell (1989) coupled with the Doucet et al, (2020) ocenic plume time-series model to calculate OLIP volume estimates through time. 

Notebook 4 and 5 use the method of Karlsen et al. (2019) to calculate the deep-water flux between the oceans and mantle.

Notebook 6 uses the method of Algeo and Wilkinson (1991) to estimate the slope of low elevation continental areas. This is then merged with the present-day continental hypsometry of Eakins and Sharman (2012) as well as bathymetry from Notebook 1 to produce a time-dependent hypsometry model.

Notebook 7 calculates the area weighted mean dynamic topography from global grids in the mantle reference frame, produced from geodynamic modelling.

Notebook 8 uses the method of Flament et al. (2008) to iteratively flood the reconstructed topography made with Notebook 6 to compute sea level for a target volume of water.

Also included are the GPlates files for the Merdith et al. (2021) plate teconic model.
Rotation files:
- 1000-410_rotations-NNR.rot
- Global_EB_250-0Ma_GK07_2017-NNR.rot
- Global_EB_410-250Ma_GK07_2017-NNR.rot
- NR_0Ma_1000Ma_for_gplates.rot

Topology building blocks:
- 1000-410-Convergence-NNR.gpml
- 1000-410-Divergence-NNR.gpml
- 1000-410-Topologies-NNR.gpml
- 1000-410-Transforms-NNR.gpml
- Global_EarthByte_Mesozoic-Cenozoic_plate_boundaries_2016_v5-NNR.gpml
- Global_EarthByte_Paleozoic_plate_boundaries_2016_v5-NNR.gpml
- TopologyBuildingBlocks_AREPS-NNR.gpml

Coastlines and COBs:
- GSHHS_l_coastlines.gpmlz
- SL_Global_COB_Terranes1Ga-410Ma.gpml
- SL_Global_COB_Terranes410-0Ma.gpml

The PlateTectonicTools folder contains a number of python programs used for plate tectonic research. They are primarily built on top of the pyGPlates Python library and are created by Michael Chin (https://github.com/michaelchin/PlateTectonicTools).

In the DependentInputs folder:
The following grid files are used in Notebook 1. They are contain present day bathymetry of oceanic trenches contained within 100, 300 and 600 km stencils. These are used to normalise time-dependent, modeled trench volume and are inverted so that gmt grdvolume can calculate the volume within the trench stencil. 
- topo_ice_6m_sz_100km_negative_only_inverted_sign_orig.nc
- topo_ice_6m_sz_300km_negative_only_inverted_sign_orig.nc
- topo_ice_6m_sz_600km_negative_only_inverted_sign_orig.nc

Also used in Notebook 1 are:
- Sea floor age grids for the Merdith et al. (2021) plate model.
- depth-1333-130-2500.dat is the age depth relationship used in the complex plate model of Richards et al. (2018).
- topo_resample.nc is the Amante and Eakins (2009) etopo1 topogrpahy model

GlobSed-v2_resample1deg-x-1deg.nc is the the Straume et al. (2019) present day sediment thickness model used in Notebook 2

Inputs for Notebook 3 OLIP modeling are:
- OLIP_polygons are outlines of the oceanic LIPs from the databases of Whittaker et al. (2015) and Johansson et al. (2018).
- lips_list.dat a list of the above polygon outlines.
- Doucet-et-al-2019-Geology-OLIPs_count is the Doucet et al. (2020) oceanic mantle plume occurrence record.
- depth2basement_meters.nc depth to basement grid calculated as the difference between the Amante and Eakins (2009) etopo1 topogrpahy model and the Straume et al. (2019) present day sediment thickness model.

For modeling hypsometry in Notebook 6:
- contETOPO_export are time-dependent raster data of the ETOPO topography model for subaerial areas only (used in hypsometry modeling).
- etopo1_hyp_curve.dat these are xy data of the Eakins and Sharman (2012) hypsometry curve.

Also include in are the dynamic and total topography from geodynamic models C1-3.


References
Algeo, T., and Wilkinson, B., 1991, Modern and ancient continental hypsometries: Journal of the Geological Society, v. 148, no. 4, p. 643-653. doi: https://doi.org/10.1144/gsjgs.148.4.0643

Doucet, L. S., Li, Z.-X., Ernst, R. E., Kirscher, U., El Dien, H. G., and Mitchell, R. N., 2020, Coupled supercontinent–mantle plume events evidenced by oceanic plume record: Geology, v. 48, no. 2, p. 159-163. doi: https://doi.org/10.1130/G46754.1

Eakins, B., and Sharman, G., 2012, Hypsographic curve of Earth’s surface from ETOPO1: NOAA National Geophysical Data Center, Boulder, CO.

Flament, N., Coltice, N., and Rey, P. F., 2008, A case for late-Archaean continental emergence from thermal evolution models and hypsometry: Earth and Planetary Science Letters, v. 275, no. 3-4, p. 326-336. doi: https://doi.org/10.1016/j.epsl.2008.08.029

Johansson, L., Zahirovic, S., and Müller, R. D., 2018, The Interplay Between the Eruption and Weathering of Large Igneous Provinces and the Deep‐Time Carbon Cycle: Geophysical Research Letters, v. 45, no. 11, p. 5380-5389. doi: https://doi.org/10.1029/2017GL076691

Karlsen, K. S., Conrad, C. P., and Magni, V., 2019, Deep Water Cycling and Sea Level Change Since the Breakup of Pangea: Geochemistry, Geophysics, Geosystems. doi: https://doi.org/10.1029/2019GC008232

Merdith, A. S., Williams, S. E., Collins, A. S., Tetley, M. G., Mulder, J. A., Blades, M. L., Young, A., Armistead, S. E., Cannon, J., Zahirovic, S., and Müller, R. D., 2021, Extending full-plate tectonic models into deep time: Linking the neoproterozoic and the phanerozoic: Earth-Science Reviews, p. 103477. doi: https://doi.org/10.1016/j.earscirev.2020.103477

Richards, F., Hoggard, M., Cowton, L., and White, N., 2018, Reassessing the thermal structure of oceanic lithosphere with revised global inventories of basement depths and heat flow measurements: Journal of Geophysical Research: Solid Earth, v. 123, no. 10, p. 9136-9161. doi: https://doi.org/10.1029/2018JB015998

Schubert, G., and Sandwell, D., 1989, submarine plateaus: Earth and Planetary Science Letters, v. 92, p. 234-246. doi: https://doi.org/10.1016/0012-821X(89)90049-6

Straume, E., Gaina, C., Medvedev, S., Hochmuth, K., Gohl, K., Whittaker, J. M., Abdul Fattah, R., Doornenbal, J., and Hopper, J. R., 2019, GlobSed: Updated total sediment thickness in the world's oceans: Geochemistry, Geophysics, Geosystems, v. 20, no. 4, p. 1756-1772. doi: https://doi.org/10.1029/2018GC008115

Whittaker, J., Afonso, J., Masterton, S., Müller, R., Wessel, P., Williams, S., and Seton, M., 2015, Long-term interaction between mid-ocean ridges and mantle plumes: Nature Geoscience, v. 8, no. 6, p. 479-483. doi: https://doi.org/10.1038/ngeo2437
