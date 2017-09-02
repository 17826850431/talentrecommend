package com.talentrecd.service;

import java.util.List;

import com.talentrecd.model.Talent;
import com.talentrecd.util.Pagination;

public interface ITalentService {
  public List<Talent> getTalentlist();
  public  Pagination<Talent>  getTalentlist(int pageNo);
}
