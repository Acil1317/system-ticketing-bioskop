-- --------------------------------------------------
-- mencatat perubahan kursi
-- --------------------------------------------------
CREATE TABLE log_perubahan_kursi (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    reservasi_id VARCHAR(10),
    old_seat_id VARCHAR(10),
    new_seat_id VARCHAR(10),
    waktu_perubahan DATETIME NOT NULL
);

DELIMITER $$

CREATE TRIGGER audit_seat_change
BEFORE UPDATE ON reservasi
FOR EACH ROW
BEGIN
    -- Cek jika kursi memang benar-benar berubah
    IF OLD.seat_id <> NEW.seat_id THEN
        INSERT INTO log_perubahan_kursi (reservasi_id, old_seat_id, new_seat_id)
        VALUES (OLD.reservasi_id, OLD.seat_id, NEW.seat_id);
    END IF;
END$$

DELIMITER ;