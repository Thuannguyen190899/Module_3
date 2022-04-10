USE studycase;

-- Câu 2:
 
SELECT * FROM studycase.nhan_vien WHERE (HO_TEN LIKE 'H%' OR HO_TEN LIKE 'T%' OR HO_TEN LIKE 'K%') AND  HO_TEN <= 15;

-- Câu 3

SELECT * FROM studycase.khach_hang WHERE (DIA_CHI LIKE '%Đà Nẵng' OR DIA_CHI LIKE '%Quảng Trị')
		AND (year(now())- year(ngay_sinh) BETWEEN 18 AND 50);

-- Câu 4:

SELECT K.HO_TEN, count(k.MA_KH) as 'So lan dat phong' FROM hop_dong h join khach_hang k ON h.MA_KHACH_HANG = k.MA_KH
	JOIN loai_khach l ON k.MA_LOAI_KHACH = l.MA_LK WHERE TEN_LK = 'Diamond'
    GROUP BY K.HO_TEN;
    
-- Câu 5: Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,
-- hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra)

SELECT KH.MA_KH, KH.HO_TEN, LK.TEN_LK, HD.MA_HD, DV.TEN_DV, HD.NGAY_LAM_HD, HD.NGAY_KET_THUC, 
	(ifnull(DV.CHI_PHI_THUE,0) + ifnull(HDCT.SO_LUONG*DVDK.GIA,0) ) AS 'Tong tien' FROM khach_hang KH
    LEFT JOIN hop_dong HD ON KH.MA_KH = HD.MA_KHACH_HANG
    LEFT JOIN loai_khach LK ON KH.MA_LOAI_KHACH = LK.MA_LK
    LEFT JOIN hop_dong_chi_tiet HDCT ON HD.MA_HD = HDCT.MA_HOP_DONG
    LEFT JOIN dich_vu DV ON HD.MA_DICH_VU = DV.MA_DV
    LEFT JOIN dich_vu_di_kem DVDK ON HDCT.MA_DICH_VU_DK = DVDK.ma_dv_dk
    GROUP BY HD.MA_HD
    ORDER BY KH.MA_KH;
   
-- Câu 6:	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 


 SELECT DV.MA_DV, DV.TEN_DV, DV.DIEN_TICH,DV.CHI_PHI_THUE, LDV.TEN_LDV FROM dich_vu DV JOIN loai_dich_vu LDV
		ON DV.MA_LOAI_DV = LDV.MA_LDV
        JOIN hop_dong HD ON DV.MA_DV = HD.MA_DICH_VU
        WHERE
        DV.MA_DV not in (
        SELECT DV.MA_DV FROM dich_vu DV 
        JOIN hop_dong HD ON DV.MA_DV = HD.MA_DICH_VU
        WHERE
        month(HD.NGAY_LAM_HD) BETWEEN 1 AND 3 and year(HD.NGAY_LAM_HD) = 2021
        )
        GROUP BY DV.MA_DV, DV.TEN_DV, DV.DIEN_TICH,DV.CHI_PHI_THUE, LDV.TEN_LDV;
        
-- Câu 7: Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT DV.MA_DV, DV.TEN_DV, DV.DIEN_TICH, DV.SO_NG_TOI_DA, DV.CHI_PHI_THUE, LDV.TEN_LDV 
FROM dich_vu DV JOIN loai_dich_vu LDV
		ON DV.MA_LOAI_DV = LDV.MA_LDV
        JOIN hop_dong HD ON DV.MA_DV = HD.MA_DICH_VU
        
        WHERE year(HD.NGAY_LAM_HD) = 2020
        
        AND
        DV.MA_DV not in (
        SELECT DV.MA_DV FROM dich_vu DV 
        JOIN hop_dong HD ON DV.MA_DV = HD.MA_DICH_VU
        WHERE
		year(HD.NGAY_LAM_HD) = 2021
        )
        GROUP BY DV.MA_DV, DV.TEN_DV, DV.DIEN_TICH, DV.SO_NG_TOI_DA, DV.CHI_PHI_THUE, LDV.TEN_LDV;
        
        
        
-- Câu 8: Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau. (DÙng 3 cách)   

	-- C1:
	
    SELECT HO_TEN FROM khach_hang 
		GROUP BY HO_TEN;
        
	-- C2:
 
	SELECT DISTINCT HO_TEN FROM khach_hang;
    
    -- C3: 
    
-- Câu 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là 
-- tương ứng với mỗi tháng trong năm 2021 thì sẽ có 
-- bao nhiêu khách hàng thực hiện đặt phòng.

SELECT  month(HD.NGAY_LAM_HD) as 'Thang' , count(HD.MA_KHACH_HANG) as 'So luong dat phong'
FROM hop_dong HD LEFT JOIN hop_dong_chi_tiet HDCT 
	ON HD.MA_HD = HDCT.MA_HOP_DONG_CHI_TIET

        WHERE year(HD.NGAY_LAM_HD) = 2021
        
        GROUP BY  month(HD.NGAY_LAM_HD);
        
        SELECT*From hop_dong_chi_tiet;
          SELECT*From hop_dong;

-- Câu 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng 
-- bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong,
-- ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).       

SELECT HD.MA_HD, HD.NGAY_LAM_HD, HD.NGAY_KET_THUC, HD.TIEN_DAT_COC, sum(HDCT.SO_LUONG) 
FROM hop_dong HD LEFT JOIN hop_dong_chi_tiet HDCT ON HD.MA_HD = HDCT.MA_HOP_DONG
GROUP BY HD.MA_HD, HD.NGAY_LAM_HD, HD.NGAY_KET_THUC, HD.TIEN_DAT_COC

-- Câu 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có 
-- ten_loai_khach là “Diamond” và có địa chỉ ở “Vinh” hoặc “Quảng Ngãi”.

SELECT DVDK.MA_dv_dk, DVDK.TEN_DV_DK, DVDK.GIA, DVDK.DON_VI, DVDK.TRANG_THAI FROM dich_vu_di_kem DVDK 
JOIN  hop_dong_chi_tiet HDCT ON DVDK.ma_dv_dk = HDCT.MA_DICH_VU_DK
JOIN hop_dong HD ON HDCT.MA_HOP_DONG = HD.MA_HD
JOIN khach_hang KH ON HD.MA_KHACH_HANG = KH.MA_KH
JOIN loai_khach LK ON KH.MA_LOAI_KHACH = LK.MA_LK
WHERE LK.TEN_LK = 'Diamond' AND (KH.DIA_CHI LIKE '%Vinh%' OR KH.DIA_CHI LIKE '%Quảng Ngãi%')

-- Câu 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021

SELECT HD.MA_HD, NV.HO_TEN as 'HO_TEN_NV', KH.HO_TEN AS 'HO_TEN_KH', KH.SO_DIEN_THOAI, DV.TEN_DV, sum(HDCT.SO_LUONG) AS 'So luong DV di kem', HD.TIEN_DAT_COC
FROM dich_vu DV JOIN hop_dong HD ON DV.MA_DV = HD.MA_DICH_VU
JOIN hop_dong_chi_tiet HDCT ON HD.MA_HD = HDCT.MA_HOP_DONG
JOIN khach_hang KH ON HD.MA_KHACH_HANG = KH.MA_KH
JOIN nhan_vien NV ON HD.MA_NHAN_VIEN = NV.MA_NV
        WHERE month(HD.NGAY_LAM_HD) BETWEEN 10 AND 12 AND year(HD.NGAY_LAM_HD) = 2020
        AND
        DV.MA_DV not in (
        SELECT DV.MA_DV FROM dich_vu DV 
        JOIN hop_dong HD ON DV.MA_DV = HD.MA_DICH_VU
		JOIN hop_dong_chi_tiet HDCT ON HD.MA_HD = HDCT.MA_HOP_DONG
        WHERE month(HD.NGAY_LAM_HD) BETWEEN 1 AND 6 AND year(HD.NGAY_LAM_HD) = 2021
        ) 
GROUP BY HD.MA_HD, NV.HO_TEN, KH.HO_TEN, KH.SO_DIEN_THOAI, DV.TEN_DV,  HD.TIEN_DAT_COC;

-- Câu 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau)
-- Cách 1:

WITH mostused as (
			SELECT DVDK.TEN_DV_DK, DVDK.ma_dv_dk, count(*) AS amount
			FROM dich_vu_di_kem DVDK
			JOIN hop_dong_chi_tiet HDCT ON HDCT.MA_DICH_VU_DK = DVDK.ma_dv_dk
			GROUP BY DVDK.TEN_DV_DK)
		SELECT * FROM mostused WHERE amount = (Select min(amount) from mostused);
    
    -- Cách 2: 
    
    CREATE TABLE IF NOT EXISTS mostused AS
		SELECT
			DVDK.TEN_DV_DK,
			DVDK.ma_dv_dk,
			count(
			*) AS amount
		FROM
			dich_vu_di_kem DVDK
			JOIN hop_dong_chi_tiet HDCT ON HDCT.MA_DICH_VU_DK = DVDK.ma_dv_dk
		GROUP BY
			DVDK.TEN_DV_DK;
            
            SELECT * FROM mostused;
            
	SELECT
	m.TEN_DV_DK,
	amount
FROM
	mostused m
WHERE
	m.amount = (
		SELECT
			max(amount)
		FROM
			mostused);

DROP TABLE mostused;
    
-- Cau 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm 
-- ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem)

SELECT DVDK.TEN_DV_DK, DVDK.GIA, DVDK.DON_VI, DVDK.TRANG_THAI, COUNT(HDCT.MA_DICH_VU_DK) AS 'So lan duoc su dung'
	FROM dich_vu_di_kem DVDK JOIN hop_dong_chi_tiet HDCT ON DVDK.ma_dv_dk = HDCT.MA_DICH_VU_DK
    JOIN hop_dong HD ON HDCT.MA_HOP_DONG = HD.MA_HD
	
    GROUP BY DVDK.TEN_DV_DK, DVDK.GIA, DVDK.DON_VI, DVDK.TRANG_THAI
    
	HAVING  COUNT(HDCT.MA_DICH_VU_DK) = 1;
    
-- Cau 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, 
-- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021

SELECT *FROM nhan_vien;
SELECT * FROM trinh_do;

SELECT NV.MA_NV, NV.HO_TEN, TD.TEN_TD, BP.TEN_BP, NV.SDT, count(HD.MA_NHAN_VIEN) 
	FROM nhan_vien NV JOIN trinh_do TD ON NV.MA_TRINH_DO = TD.MA_TD
    JOIN bo_phan BP ON NV.MA_BO_PHAN = BP.MA_BP
    JOIN hop_dong HD ON NV.MA_NV = HD.MA_NHAN_VIEN
    WHERE year(HD.NGAY_LAM_HD) BETWEEN 2020 AND 2021
    GROUP BY NV.MA_NV, NV.HO_TEN, TD.TEN_TD
    HAVING count(HD.MA_NHAN_VIEN) <= 3;
    
-- Câu 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021

delete from nhan_vien where Ma_NV not in 
		(SELECT xoa.MA_NV FROM(
				SELECT NV.MA_NV FROM nhan_vien NV JOIN hop_dong HD ON NV.MA_NV = HD.MA_NHAN_VIEN
				WHERE year(HD.NGAY_LAM_HD) BETWEEN 2019 AND 2021
				) as xoa);

-- Câu 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ
	
    
    
UPDATE khach_hang SET MA_LOAI_KHACH =  1 
	WHERE Ma_KH IN 
			(SELECT  tmp.MA_KH, tmp.Tong
						FROM (
							SELECT  KH.MA_KH,
							sum(DV.CHI_PHI_THUE + HDCT.SO_LUONG*DVDK.GIA) AS Tong FROM  hop_dong HD 
							 LEFT JOIN khach_hang KH ON KH.MA_KH = HD.MA_KHACH_HANG
							 LEFT JOIN loai_khach LK ON KH.MA_LOAI_KHACH = LK.MA_LK
							 LEFT JOIN hop_dong_chi_tiet HDCT ON HD.MA_HD = HDCT.MA_HOP_DONG
							LEFT JOIN dich_vu DV ON HD.MA_DICH_VU = DV.MA_DV
							 LEFT JOIN dich_vu_di_kem DVDK ON HDCT.MA_DICH_VU_DK = DVDK.ma_dv_dk
								WHERE year(HD.NGAY_LAM_HD) = 2021 AND LK.MA_LK = 2
							GROUP BY KH.MA_KH
							HAVING Tong > 10000000
							) AS tmp) ;

-- Cau 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

DELETE FROM khach_hang WHERE HO_TEN IN 
		(SELECT bangHD.HO_TEN FROM (
				SELECT KH.HO_TEN FROM khach_hang KH JOIN hop_dong HD ON KH.MA_KH = HD.MA_KHACH_HANG
				WHERE year(HD.NGAY_LAM_HD) < 2021
				) AS bangHD);
        
-- Cau 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi

UPDATE dich_vu_di_kem SET GIA = GIA*2 WHERE ma_dv_dk IN
			(SELECT bang.ma_dv_dk
				FROM
				(
				SELECT DVDK.TEN_DV_DK, DVDK.ma_dv_dk, sum(HDCT.SO_LUONG) AS amount
				FROM dich_vu_di_kem DVDK
				JOIN hop_dong_chi_tiet HDCT ON HDCT.MA_DICH_VU_DK = DVDK.ma_dv_dk
				JOIN hop_dong HD ON HDCT.MA_HOP_DONG = HD.MA_HD
				WHERE year(HD.NGAY_LAM_HD) = 2020 
				GROUP BY DVDK.TEN_DV_DK
				HAVING amount > 10
				) AS bang);
                
 -- Cau 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị 
 -- bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi           

SELECT MA_NV as 'ID', HO_TEN, NGAY_SINH, SDT, EMAIL, DIA_CHI FROM nhan_vien
UNION
SELECT MA_KH, HO_TEN, NGAY_SINH, SO_DIEN_THOAI, EMAIL, DIA_CHI FROM khach_hang;

-- Cau 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên 
-- có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một
-- hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

CREATE VIEW v_nhan_vien AS SELECT * FROM nhan_vien WHERE DIA_CHI LIKE '%Hải Châu%' AND 
	(SELECT NV.HO_TEN FROM nhan_vien NV JOIN hop_dong HD ON NV.MA_NV = HD.MA_NHAN_VIEN
    WHERE HD.NGAY_LAM_HD = '2019-12-12'
    );
    
    SELECT * FROM v_nhan_vien;
    DROP VIEW v_nhan_vien;
    
-- Cau 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

UPDATE  v_nhan_vien SET DIA_CHI = 'Liên Chiểu';

