SELECT 
		 		PTNRKY,
				PTNRTY,
				NVL((SELECT CDESC1 FROM CMCDV C WHERE C.CMCDKY = 'PTNRTY' AND C.CMCDVL = A.PTNRTY),' ') AS PTNRTYT,
				DELMAK,
				NAME01,
				xx1.dec_varchar2_sel(NAME02, 10, 'NAME'),
				NAME03,
				ADDR01,
				ADDR02,
				ADDR03,
				ADDR04,
				ADDR05,
				CITY01,
				REGN01,
				POSTCD,
				NATNKY,
				NVL((SELECT CDESC1 FROM CMCDV C WHERE CMCDKY = 'NATNKY' AND C.CMCDVL = A.NATNKY),' ') AS NATNKYT,
				TELN01,
				TELN02,
				TELN03,
				FAXTL1,
				FAXTL2,
				TAXCD1,
				TAXCD2,
				VATREG,
				POBOX1,
				POBPC1,
				EMAIL1,
				EMAIL2,
				xx1.dec_varchar2_sel(CTTN01, 10, 'NAME'),
				xx1.dec_varchar2_sel(CTTT01, 10, 'NAME'),
				xx1.dec_varchar2_sel(CTTT02, 10, 'NAME'),
				xx1.dec_varchar2_sel(CTTM01, 10, 'MAIL'),
				xx1.dec_varchar2_sel(SALN01, 10, 'NAME'),
				xx1.dec_varchar2_sel(SALT01, 10, 'PHONE'),
				xx1.dec_varchar2_sel(SALT02, 10, 'PHONE'),
				xx1.dec_varchar2_sel(SALM01, 10, 'MAIL'),
				EXPTNK,
				OWNRKY,
				CUSTMR,
				PTNG01,
				PTNG02,
				PTNG03,
				PTNG04,
				PTNG05,
				PTNL01,
				NVL((SELECT NAME01 FROM BZPTN WHERE OWNRKY = A.OWNRKY AND PTNRTY = 'CO' AND PTNRKY = A.PTNL01),' ') AS PTNL01NM,
				PTNL02,
				PTNL03,
				PTNL04,
				PTNL05,
				WTOPPM,
				WTOPMU,
				WTOPDV,
				PROCHA,
				CREDAT,
				CRETIM,
				CREUSR,
				NVL((SELECT xx1.dec_varchar2_sel(NMLAST, 10, 'NAME') FROM USRMA WHERE USERID = A.CREUSR),' ') AS CUSRNM,
				LMODAT,
				LMOTIM,
				LMOUSR,
				NVL((SELECT xx1.dec_varchar2_sel(NMLAST, 10, 'NAME') FROM USRMA WHERE USERID = A.LMOUSR),' ') AS LUSRNM,
				INDBZL,
				INDARC,
				UPDCHK
		 FROM   BZPTN A
		WHERE  1 = 1
		
		
			AND A.PTNRTY = 'CT'
<select id="BZPTN_LIST" parameterClass="Map" resultClass="DataMap">
		 SELECT 
		 		PTNRKY,
				PTNRTY,
				NVL((SELECT CDESC1 FROM CMCDV C WHERE C.CMCDKY = 'PTNRTY' AND C.CMCDVL = A.PTNRTY),' ') AS PTNRTYT,
				DELMAK,
				NAME01,
				xx1.dec_varchar2_sel(NAME02, 10, 'NAME'),
				NAME03,
				ADDR01,
				ADDR02,
				ADDR03,
				ADDR04,
				ADDR05,
				CITY01,
				REGN01,
				POSTCD,
				NATNKY,
				NVL((SELECT CDESC1 FROM CMCDV C WHERE CMCDKY = 'NATNKY' AND C.CMCDVL = A.NATNKY),' ') AS NATNKYT,
				TELN01,
				TELN02,
				TELN03,
				FAXTL1,
				FAXTL2,
				TAXCD1,
				TAXCD2,
				VATREG,
				POBOX1,
				POBPC1,
				EMAIL1,
				EMAIL2,
				xx1.dec_varchar2_sel(CTTN01, 10, 'NAME'),
				xx1.dec_varchar2_sel(CTTT01, 10, 'NAME'),
				xx1.dec_varchar2_sel(CTTT02, 10, 'NAME'),
				xx1.dec_varchar2_sel(CTTM01, 10, 'MAIL'),
				xx1.dec_varchar2_sel(SALN01, 10, 'NAME'),
				xx1.dec_varchar2_sel(SALT01, 10, 'PHONE'),
				xx1.dec_varchar2_sel(SALT02, 10, 'PHONE'),
				xx1.dec_varchar2_sel(SALM01, 10, 'MAIL'),
				EXPTNK,
				OWNRKY,
				CUSTMR,
				PTNG01,
				PTNG02,
				PTNG03,
				PTNG04,
				PTNG05,
				PTNL01,
				NVL((SELECT NAME01 FROM BZPTN WHERE OWNRKY = A.OWNRKY AND PTNRTY = 'CO' AND PTNRKY = A.PTNL01),' ') AS PTNL01NM,
				PTNL02,
				PTNL03,
				PTNL04,
				PTNL05,
				WTOPPM,
				WTOPMU,
				WTOPDV,
				PROCHA,
				CREDAT,
				CRETIM,
				CREUSR,
				NVL((SELECT xx1.dec_varchar2_sel(NMLAST, 10, 'NAME') FROM USRMA WHERE USERID = A.CREUSR),' ') AS CUSRNM,
				LMODAT,
				LMOTIM,
				LMOUSR,
				NVL((SELECT xx1.dec_varchar2_sel(NMLAST, 10, 'NAME') FROM USRMA WHERE USERID = A.LMOUSR),' ') AS LUSRNM,
				INDBZL,
				INDARC,
				UPDCHK
		 FROM   BZPTN A
		WHERE  1 = 1
		<isNotEmpty property="PTNRKY">
			AND A.PTNRKY = #PTNRKY#
		</isNotEmpty>
		<isNotEmpty property="PTNRTY">
			AND A.PTNRTY = #PTNRTY#
		</isNotEmpty>
		<isNotEmpty property="PTNG01">
			AND A.PTNG01 = #PTNG01#
		</isNotEmpty>
		<isNotEmpty property="PTNG02">
			AND A.PTNG02 = #PTNG02#
		</isNotEmpty>
		<isEqual property="DELMAK" compareValue="Y">
			AND TRIM(A.DELMAK) IS NOT NULL
		</isEqual>
		<isEqual property="DELMAK" compareValue="N">
			AND TRIM(A.DELMAK) IS NULL
		</isEqual>
		<isNotEmpty property="RANGE_SQL">
			$RANGE_SQL$
		</isNotEmpty>
	</select>
-- BZPTN Insert
<insert id="BZPTN_INSERT" parameterClass="Map">
    INSERT INTO BZPTN 
    (
         PTNRKY
         ,PTNRTY
         ,DELMAK
         ,NAME01
         ,NAME02
         ,ADDR01
         ,POSTCD
         ,TELN01
         ,VATREG
         ,PTNL03
         ,PTNL04
         ,PROCHA
         ,PTNG01
         ,EWGUBN
     ) 
    VALUES 
    (
         ('BZP' || LPAD(BZP_SEQ.NEXTVAL, 7, '0'))
         ,#PTNRTY#
         ,#DELMAK#
         ,#NAME01#
         ,xx1.enc_varchar2_ins('#NAME02#', 10, 'NAME')
         ,#ADDR01#
         ,#POSTCD#
         ,#TELN01#
         ,#VATREG#
         ,#PTNL03#
         ,#PTNL04#
         ,#PROCHA#
         ,#PTNG01#
         ,'W'
    )
</insert>

<insert id="BZ01BZPTN_INSERT" parameterClass="Map">
   		INSERT INTO BZPTN  (PTNRKY
                            ,PTNRTY,DELMAK
                            ,NAME01,NAME02
                            ,NAME03,ADDR01
                            ,ADDR02,ADDR03
                            ,ADDR04,ADDR05
                            ,CITY01,REGN01
                            ,POSTCD,NATNKY
                            ,TELN01,TELN02
                            ,TELN03,FAXTL1
                            ,FAXTL2,TAXCD1
                            ,TAXCD2,VATREG
                            ,POBOX1,POBPC1
                            ,EMAIL1,EMAIL2
                            ,CTTN01,CTTT01
                            ,CTTT02,CTTM01
                            ,SALN01,SALT01
                            ,SALT02,SALM01
                            ,EXPTNK,OWNRKY
                            ,CUSTMR,PTNG01
                            ,PTNG02,PTNG03
                            ,PTNG04,PTNG05
                            ,PTNL01,PTNL02
                            ,PTNL03,PTNL04
                            ,PTNL05,WTOPPM
                            ,WTOPMU,WTOPDV
                            ,PROCHA,CREDAT
                            ,CRETIM,CREUSR
		 ,LMODAT,LMOTIM
                            ,LMOUSR,INDBZL
                            ,INDARC,UPDCHK
                            ,EWGUBN) 
		 VALUES (#PTNRKY#
                ,#PTNRTY#,#DELMAK#
                ,#NAME01#,xx1.enc_varchar2_ins('#NAME02#', 10, 'NAME')
                ,' ',#ADDR01#
                ,' ',' '
                ,' ',' '
                ,' ',' '
                ,#POSTCD#,' '
                ,#TELN01#,' '
                ,' ',' '
                ,' ',' '
                ,' ',#VATREG#
                ,' ',' '
                ,' ',' '
                ,xx1.enc_varchar2_ins('#CTTN01#', 10, 'PHONE'),xx1.enc_varchar2_ins('#CTTT01#', 10, 'PHONE')
                ,xx1.enc_varchar2_ins('#CTTT02#', 10, 'PHONE'),xx1.enc_varchar2_ins('#CTTM01#', 10, 'PHONE')
                ,xx1.enc_varchar2_ins('#SALN01#', 10, 'PHONE'),xx1.enc_varchar2_ins('#SALT01#', 10, 'PHONE')
                ,xx1.enc_varchar2_ins('#SALT02#', 10, 'PHONE'),xx1.enc_varchar2_ins('#SALM01#', 10, 'MAIL')
                ,' ',' '
                ,' ',#PTNG01#
                ,' ',' '
                ,' ',' '
                ,' ',' '
                ,#PTNL03#,#PTNL04#
                ,' ','0'
                ,'0','0'
                ,' ',TO_CHAR(SYSDATE, 'YYYYMMDD')
                ,TO_CHAR(SYSDATE, 'HH24MISS'),#SES_USER_ID#,
                TO_CHAR(SYSDATE, 'YYYYMMDD'),TO_CHAR(SYSDATE, 'HH24MISS')
                ,#SES_USER_ID#,' '
                ,' ', '0'
                ,#EWGUBN#)
   	</insert>

-- BZPTN Update
<update id="BZPTN_UPDATE" parameterClass="Map">
		UPDATE BZPTN SET
		 	   LMODAT = TO_CHAR(SYSDATE, 'YYYYMMDD')
			 , LMOTIM = TO_CHAR(SYSDATE, 'HH24MISS')
			 , LMOUSR = #SES_USER_ID#
		      <isNotEmpty property="PTNRKY">
		      ,PTNRKY = #PTNRKY#
		      </isNotEmpty>
			  <isNotEmpty property="PTNRTY">
		      ,PTNRTY = #PTNRTY#
		      </isNotEmpty>
		      <isNotEmpty property="DELMAK">
		      ,DELMAK = #DELMAK#
		      </isNotEmpty>
		      <isNotEmpty property="NAME01">
		      ,NAME01 = #NAME01#
		      </isNotEmpty>
		      <isNotEmpty property="NAME02">
		      ,NAME02 = xx1.enc_varchar2_ins(#NAME02#, 10, 'NAME')
		       </isNotEmpty>
		      <isNotEmpty property="ADDR01">
		      ,ADDR01 = #ADDR01#
		      </isNotEmpty>
		      <isNotEmpty property="POSTCD">
		      ,POSTCD = #POSTCD#
		      </isNotEmpty>
		      <isNotEmpty property="TELN01">
		      ,TELN01 = #TELN01#
		      </isNotEmpty>
		      <isNotEmpty property="VATREG">
		      ,VATREG = #VATREG#
		      </isNotEmpty>
		      <isNotEmpty property="PTNL3">
		      ,PTNL3 = #PTNL3#
		      </isNotEmpty>
		      <isNotEmpty property="PTNL4">
		      ,PTNL4 = #PTNL4#
		      </isNotEmpty>
		      <isNotEmpty property="PROCHA1">
		      ,PROCHA1 = #PROCHA1#
		      </isNotEmpty>
		      <isNotEmpty property="EXPTNK">
		      ,EXPTNK = #EXPTNK#
		      </isNotEmpty>
		      <isNotEmpty property="PTNG01">
		      ,PTNG01 = #PTNG01#
		      </isNotEmpty>
		      <isNotEmpty property="PTNG02">
		      ,PTNG02 = #PTNG02#
		      </isNotEmpty>
		      <isNotEmpty property="PTNG05">
		      ,PTNG05 = #PTNG05#
		      </isNotEmpty>
		      <isNotEmpty property="PTNL05">
		      ,PTNL05 = #PTNL05#
		      </isNotEmpty>
		      <isNotEmpty property="PROCHA">
		      ,PROCHA = #PROCHA#
		      </isNotEmpty>
		 WHERE 1 = 1
		   AND PTNRKY = #PTNRKY#
		   AND PTNRTY = #PTNRTY#
</update>