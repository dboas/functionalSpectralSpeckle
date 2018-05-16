function [exs] = GetExtinctions( lambda )
%
% GetExtinctions( lambda )
%
%       Returns the extinction coefficients for 
%         [HbO Hb H2O lipid aa3]
%       for the specified wavelengths.
%
%	These values for the molar extinction coefficient e 
% 	in [cm-1/(moles/liter)] were compiled by Scott Prahl 
%	(prahl@ece.ogi.edu) using data from 
%	W. B. Gratzer, Med. Res. Council Labs, Holly Hill, London 
%	N. Kollias, Wellman Laboratories, Harvard Medical School, Boston 
%	To convert this data to absorbance A, multiply by the 
%	molar concentration and the pathlength. For example, if x is the 
%	number of grams per liter and a 1 cm cuvette is being used, 
%	then the absorbance is given by 
%
%        (e) [(1/cm)/(moles/liter)] (x) [g/liter] (1) [cm]
%  A =  ---------------------------------------------------
%                          66,500 [g/mole]
%
%	using 66,500 as the gram molecular weight of hemoglobin. 
%	To convert this data to absorption coefficient in (cm-1), multiply 
%	by the molar concentration and 2.303, 
%
%	�a = (2.303) e (x g/liter)/(66,500 g Hb/mole) 
%	where x is the number of grams per liter. A typical value of x 
%	for whole blood is x=150 g Hb/liter. 
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  $Author: dboasg $
%
%  $Date: 2008/05/12 18:11:24 $
%
%  $Revision: 1.1 $
%
%  $Log: sscGetExtinctions.m,v $
%  Revision 1.1  2008/05/12 18:11:24  dboasg
%  initial version
%
%  Revision 1.4  2002/02/18 20:20:02  dboas
%  Corrected the units of lipid absorption to be per cm rather than per mm.
%  Also, now interpolate for wavelengths between those specified.
%
%  Revision 1.3  2001/04/27 20:46:53  dboas
%  Maria Angela Updated the extinction coefficients for Hb and HbO
%
%  Revision 1.2  2000/09/06 12:10:12  dboas
%  Added extinction coefficients for lipid and aa3.
%
%  Revision 1.1.1.1  2000/05/25 13:14:47  dboas
%  initial
%
%  Revision 1.2  2000/01/10 00:14:14  dboas
%  Storing the source and detector lists for use by other functions
%
%  Revision 1.1  1999/11/18 14:21:00  tgaudett
%  Initial Routines for Chromophores
%  HB, HbO, H2O
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test git
num_lambda = length(lambda);

%These values for the molar extinction coefficient e in [cm-1/(moles/liter)] were compiled by Scott Prahl (prahl@ece.ogi.edu) using data from 
%
%W. B. Gratzer, Med. Res. Council Labs, Holly Hill, London 
%N. Kollias, Wellman Laboratories, Harvard Medical School, Boston 
%To convert this data to absorbance A, multiply by the molar concentration and the pathlength. For example, if x is the number of grams per liter and a 1 cm cuvette is being used, then the absorbance is given by 
%
%        (e) [(1/cm)/(moles/liter)] (x) [g/liter] (1) [cm]
%  A =  ---------------------------------------------------
%                          66,500 [g/mole]
%
%using 66,500 as the gram molecular weight of hemoglobin. 
%To convert this data to absorption coefficient in (cm-1), multiply by the molar concentration and 2.303, 
%
%�a = (2.303) e (x g/liter)/(66,500 g Hb/mole) 
%where x is the number of grams per liter. A typical value of x for whole blood is x=150 g Hb/liter. 

vLambdaHbOHb = [
250	106112	112736;
252	105552	112736;
254	107660	112736;
256	109788	113824;
258	112944	115040;
260	116376	116296;
262	120188	117564;
264	124412	118876;
266	128696	120208;
268	133064	121544;
270	136068	122880;
272	137232	123096;
274	138408	121952;
276	137424	120808;
278	135820	119840;
280	131936	118872;
282	127720	117628;
284	122280	114820;
286	116508	112008;
288	108484	107140;
290	104752	98364;
292	98936	91636;
294	88136	85820;
296	79316	77100;
298	70884	69444;
300	65972	64440;
302	63208	61300;
304	61952	58828;
306	62352	56908;
308	62856	57620;
310	63352	59156;
312	65972	62248;
314	69016	65344;
316	72404	68312;
318	75536	71208;
320	78752	74508;
322	82256	78284;
324	85972	82060;
326	89796	85592;
328	93768	88516;
330	97512	90856;
332	100964	93192;
334	103504	95532;
336	104968	99792;
338	106452	104476;
340	107884	108472;
342	109060	110996;
344	110092	113524;
346	109032	116052;
348	107984	118752;
350	106576	122092;
352	105040	125436;
354	103696	128776;
356	101568	132120;
358	97828	133632;
360	94744	134940;
362	92248	136044;
364	89836	136972;
366	88484	137900;
368	87512	138856;
370	88176	139968;
372	91592	141084;
374	95140	142196;
376	98936	143312;
378	103432	144424;
380	109564	145232;
382	116968	145232;
384	125420	148668;
386	135132	153908;
388	148100	159544;
390	167748	167780;
392	189740	180004;
394	212060	191540;
396	231612	202124;
398	248404	212712;
400	266232	223296;
402	284224	236188;
404	308716	253368;
406	354208	270548;
408	422320	287356;
410	466840	303956;
412	500200	321344;
414	524280	342596;
416	521880	363848;
418	515520	385680;
420	480360	407560;
422	431880	429880;
424	376236	461200;
426	326032	481840;
428	283112	500840;
430	246072	528600;
432	214120	552160;
434	165332	552160;
436	132820	547040;
438	119140	501560;
440	102580	413280;
442	92780	363240;
444	81444	282724;
446	76324	237224;
448	67044	173320;
450	62816	103292;
452	58864	62640;
454	53552	36170;
456	49496	30698.8;
458	47496	25886.4;
460	44480	23388.8;
462	41320	20891.2;
464	39807.2	19260.8;
466	37073.2	18142.4;
468	34870.8	17025.6;
470	33209.2	16156.4;
472	31620	15310;
474	30113.6	15048.4;
476	28850.8	14792.8;
478	27718	14657.2;
480	26629.2	14550;
482	25701.6	14881.2;
484	25180.4	15212.4;
486	24669.6	15543.6;
488	24174.8	15898;
490	23684.4	16684;
492	23086.8	17469.6;
494	22457.6	18255.6;
496	21850.4	19041.2;
498	21260	19891.2;
500	20932.8	20862;
502	20596.4	21832.8;
504	20418	22803.6;
506	19946	23774.4;
508	19996	24745.2;
510	20035.2	25773.6;
512	20150.4	26936.8;
514	20429.2	28100;
516	21001.6	29263.2;
518	22509.6	30426.4;
520	24202.4	31589.6;
522	26450.4	32851.2;
524	29269.2	34397.6;
526	32496.4	35944;
528	35990	37490;
530	39956.8	39036.4;
532	43876	40584;
534	46924	42088;
536	49752	43592;
538	51712	45092;
540	53236	46592;
542	53292	48148;
544	52096	49708;
546	49868	51268;
548	46660	52496;
550	43016	53412;
552	39675.2	54080;
554	36815.2	54520;
556	34476.8	54540;
558	33456	54164;
560	32613.2	53788;
562	32620	52276;
564	33915.6	50572;
566	36495.2	48828;
568	40172	46948;
570	44496	45072;
572	49172	43340;
574	53308	41716;
576	55540	40092;
578	54728	38467.6;
580	50104	37020;
582	43304	35676.4;
584	34639.6	34332.8;
586	26600.4	32851.6;
588	19763.2	31075.2;
590	14400.8	28324.4;
592	10468.4	25470;
594	7678.8	22574.8;
596	5683.6	19800;
598	4504.4	17058.4;
600	3200	14677.2;
602	2664	13622.4;
604	2128	12567.6;
606	1789.2	11513.2;
608	1647.6	10477.6;
610	1506	9443.6;
612	1364.4	8591.2;
614	1222.8	7762;
616	1110	7344.8;
618	1026	6927.2;
620	942	6509.6;
622	858	6193.2;
624	774	5906.8;
626	707.6	5620;
628	658.8	5366.8;
630	610	5148.8;
632	561.2	4930.8;
634	512.4	4730.8;
636	478.8	4602.4;
638	460.4	4473.6;
640	442	4345.2;
642	423.6	4216.8;
644	405.2	4088.4;
646	390.4	3965.08;
648	379.2	3857.6;
650.0	506.0	3743.0;
652.0	488.0	3677.0;
654.0	474.0	3612.0;
656.0	464.0	3548.0;
658.0	454.3	3491.3;
660.0	445.0	3442.0;
662.0	438.3	3364.7;
664.0	433.8	3292.8;
666.0	431.3	3226.3;
668.0	429.0	3133.0;
670.0	427.0	3013.0;
672.0	426.5	2946.0;
674.0	426.0	2879.0;
676.0	424.0	2821.7;
678.0	423.0	2732.3;
680.0	423.0	2610.8;
682.0	422.0	2497.3;
684.0	420.0	2392.0;
686.0	418.0	2292.7;
688.0	416.5	2209.3;
690.0	415.5	2141.8;
692.0	415.0	2068.7;
694.0	415.0	1990.0;
696.0	415.5	1938.5;
698.0	416.0	1887.0;
700.0	419.3	1827.7;
702.0	422.5	1778.5;
704.0	425.5	1739.5;
706.0	429.7	1695.7;
708.0	435.0	1647.0;
710.0	441.0	1601.7;
712.0	446.5	1562.5;
714.0	451.5	1529.5;
716.0	458.0	1492.0;
718.0	466.0	1450.0;
720.0	472.7	1411.3;
722.0	479.5	1380.0;
724.0	486.5	1356.0;
726.0	494.3	1331.7;
728.0	503.0	1307.0;
730.0	510.0	1296.5;
732.0	517.0	1286.0;
734.0	521.0	1286.0;
736.0	530.7	1293.0;
738.0	546.0	1307.0;
740.0	553.5	1328.0;
742.0	561.0	1349.0;
744.0	571.0	1384.3;
746.0	581.3	1431.3;
748.0	592.0	1490.0;
750.0	600.0	1532.0;
752.0	608.0	1574.0;
754.0	618.7	1620.7;
756.0	629.7	1655.3;
758.0	641.0	1678.0;
760.0	645.5	1669.0;
762.0	650.0	1660.0;
764.0	666.7	1613.3;
766.0	681.0	1555.0;
768.0	693.0	1485.0;
770.0	701.5	1425.0;
772.0	710.0	1365.0;
774.0	722.0	1288.3;
776.0	733.7	1216.3;
778.0	745.0	1149.0;
780.0	754.0	1107.5;
782.0	763.0	1066.0;
784.0	775.0	1021.3;
786.0	787.0	972.0;
788.0	799.0	918.0;
790.0	808.0	913.0;
792.0	817.0	908.0;
794.0	829.0	887.3;
796.0	840.7	868.7;
798.0	852.0	852.0;
800.0	863.3	838.7;
802.0	873.3	828.0;
804.0	881.8	820.0;
806.0	891.7	812.0;
808.0	903.0	804.0;
810.0	914.3	798.7;
812.0	924.7	793.7;
814.0	934.0	789.0;
816.0	943.0	787.0;
818.0	952.0	785.0;
820.0	962.7	783.0;
822.0	973.0	781.0;
824.0	983.0	779.0;
826.0	990.5	778.5;
828.0	998.0	778.0;
830.0	1008.0	778.0;
832.0	1018.0	777.7;
834.0	1028.0	777.0;
836.0	1038.0	777.0;
838.0	1047.7	777.0;
840.0	1057.0	777.0;
842.0	1063.5	777.5;
844.0	1070.0	778.0;
846.0	1079.3	779.3;
848.0	1088.3	780.3;
850.0	1097.0	781.0;
852.0	1105.7	783.0;
854.0	1113.0	785.0;
856.0	1119.0	787.0;
858.0	1126.0	789.3;
860.0	1134.0	792.0;
862.0	1142.0	795.3;
864.0	1149.7	799.0;
866.0	1157.0	803.0;
868.0	1163.7	807.7;
870.0	1170.3	812.3;
872.0	1177.0	817.0;
874.0	1182.0	820.5;
876.0	1187.0	824.0;
878.0	1193.0	830.0;
880.0	1198.7	835.7;
882.0	1204.0	841.0;
884.0	1209.3	847.0;
886.0	1214.3	852.7;
888.0	1219.0	858.0;
890.0	1223.7	863.3;
892.0	1227.5	867.8;
894.0	1230.5	871.3;
896.0	1234.0	875.3;
898.0	1238.0	880.0;
900.0	1241.3	883.3;
902	1202	765.04;
904	1206	767.44;
906	1209.2	769.8;
908	1211.6	772.16;
910	1214	774.56;
912	1216.4	776.92;
914	1218.8	778.4;
916	1220.8	778.04;
918	1222.4	777.72;
920	1224	777.36;
922	1225.6	777.04;
924	1227.2	776.64;
926	1226.8	772.36;
928	1224.4	768.08;
930	1222	763.84;
932	1219.6	752.28;
934	1217.2	737.56;
936	1215.6	722.88;
938	1214.8	708.16;
940	1214	693.44;
942	1213.2	678.72;
944	1212.4	660.52;
946	1210.4	641.08;
948	1207.2	621.64;
950	1204	602.24;
952	1200.8	583.4;
954	1197.6	568.92;
956	1194	554.48;
958	1190	540.04;
960	1186	525.56;
962	1182	511.12;
964	1178	495.36;
966	1173.2	473.32;
968	1167.6	451.32;
970	1162	429.32;
972	1156.4	415.28;
974	1150.8	402.28;
976	1144	389.288;
978	1136	374.944;
980	1128	359.656;
982	1120	344.372;
984	1112	329.084;
986	1102.4	313.796;
988	1091.2	298.508;
990	1080	283.22;
992	1068.8	267.932;
994	1057.6	252.648;
996	1046.4	237.36;
998	1035.2	222.072;
1000	1024	206.784  ];


vLambdaHbOHb(:,2) = vLambdaHbOHb(:,2) * 2.303;
vLambdaHbOHb(:,3) = vLambdaHbOHb(:,3) * 2.303;

exs = zeros(num_lambda, 2);

if(size(lambda,2) > size(lambda,1))
  lambda=lambda';
end

% HbO, Hb
ind=find(lambda>=250 & lambda<=1000);
exs(ind,1)=interp1(vLambdaHbOHb(:,1),vLambdaHbOHb(:,2),lambda(ind));
exs(ind,2)=interp1(vLambdaHbOHb(:,1),vLambdaHbOHb(:,3),lambda(ind));
