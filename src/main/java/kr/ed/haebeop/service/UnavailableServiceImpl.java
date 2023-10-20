package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Unavailable;
import kr.ed.haebeop.persistence.UnavailableMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UnavailableServiceImpl implements UnavailableService{
    @Autowired
    UnavailableMapper unavailableMapper;

    @Override
    public List<Unavailable> unavailableMonthList(Unavailable unavailable) {
        return unavailableMapper.unavailableMonthList(unavailable);
    }

    @Override
    public void unavailableInsert(Unavailable unavailable) {
        unavailableMapper.unavailableInsert(unavailable);
    }

    @Override
    public void unavailableDelete(int unNo) {
        unavailableMapper.unavailableDelete(unNo);
    }
}
