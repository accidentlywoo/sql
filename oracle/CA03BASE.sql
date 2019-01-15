SELECT 
			B.NAME01
			,W.WADN01
			,W.NAME03
			,W.EXCOMK
		FROM BZPTN B
			INNER JOIN WAHMA W ON B.WAREKY = W.WAREKY
			INNER JOIN ORDDH H ON W.WAREKY = H.WAREKY
			INNER JOIN ROTDI R ON B.EXPTNK = R.TRPCMP
		WHERE 1=1
		<isNotEmpty property="TRPCMP">			
			   AND R.TRPCMP = #TRPCMP# 
		  </isNotEmpty>
		<isEqual property="STYPE" compareValue="TD">
	  		AND TO_CHAR(TO_DATE(H.STRDAT, 'YYYYMMDD'), 'YYYYMMDD') = TO_CHAR(TO_DATE(#DAYDAT#, 'YYYYMMDD'), 'YYYYMMDD')
	  	</isEqual>
		<isEqual property="STYPE" compareValue="TM">
	  		AND TO_CHAR(TO_DATE(H.STRDAT, 'YYYYMMDD'), 'YYYYMM') = TO_CHAR(TO_DATE(#TMCAL_Y#||#TMCAL_M#, 'YYYYMM'), 'YYYYMM')
	  	</isEqual>