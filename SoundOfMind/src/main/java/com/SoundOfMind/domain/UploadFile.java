package com.SoundOfMind.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UploadFile {
    private String fileName;
    private String uploadPath;
    private String uuid;
    private boolean image;
}